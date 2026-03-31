package com.example.service

import com.example.config.AppUsage
import com.example.config.Recommendations
import com.example.config.UserSubscriptions
import com.example.config.Services
import com.example.config.ServicePlans
import com.example.model.Subscription
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.SqlExpressionBuilder.inList
import org.jetbrains.exposed.sql.SqlExpressionBuilder.less
import org.jetbrains.exposed.sql.transactions.transaction
import java.time.LocalDate

class SubscriptionService(private val recommendationService: RecommendationService) {

    fun addSubscription(
        emailAddress: String,
        serviceName: String,
        type: String?,
        endDate: LocalDate?,
        price: Double?,
        paymentFrequency: String?,
        planName: String?
    ) {
        transaction {
            UserSubscriptions.insert {
                it[UserSubscriptions.emailAddress] = emailAddress
                it[UserSubscriptions.serviceName] = serviceName
                it[UserSubscriptions.type] = type
                it[UserSubscriptions.endDate] = endDate
                it[UserSubscriptions.price] = price
                it[UserSubscriptions.paymentFrequency] = paymentFrequency
                it[UserSubscriptions.planName] = planName
            }
            // Call generateRecommendation after adding subscription
            recommendationService.generateRecommendation(emailAddress)
        }
    }
    fun addCustomSubscription(
        emailAddress: String,
        serviceName: String,
        type: String?,
        endDate: LocalDate?,
        price: Double?,
        paymentFrequency: String?,
        planName: String?
    ) {
        transaction {
            // Check if the service already exists in the Services table
            val existingService = Services.select { Services.serviceName eq serviceName }.count() > 0
            if (!existingService) {
                Services.insert {
                    it[Services.serviceName] = serviceName
                    it[Services.category] = category
                    it[Services.ratings] = null
                    it[Services.googlePlayLink] = null
                }
                ServicePlans.insert {
                    it[ServicePlans.serviceName] = serviceName
                    it[ServicePlans.planName] = planName ?: ""
                    it[ServicePlans.description] = null
                    it[ServicePlans.priceAED] = price
                    it[ServicePlans.paymentFrequency] = paymentFrequency
                }
            }

            // Add the subscription
            UserSubscriptions.insert {
                it[UserSubscriptions.emailAddress] = emailAddress
                it[UserSubscriptions.serviceName] = serviceName
                it[UserSubscriptions.type] = type
                it[UserSubscriptions.endDate] = endDate
                it[UserSubscriptions.price] = price
                it[UserSubscriptions.paymentFrequency] = paymentFrequency
                it[UserSubscriptions.planName] = planName
            }
            // Call generateRecommendation after adding subscription
            recommendationService.generateRecommendation(emailAddress)
        }
    }

    fun removeSubscription(emailAddress: String, serviceName: String) {
        transaction {
            // Delete corresponding entries in the AppUsage table
            AppUsage.deleteWhere {
                (AppUsage.emailAddress eq emailAddress) and
                        (AppUsage.serviceName eq serviceName)
            }

            // Fetch the category of the service
            val category = Services.select { Services.serviceName eq serviceName }
                .firstOrNull()?.get(Services.category)

            // Delete the subscription entry
            UserSubscriptions.deleteWhere {
                (UserSubscriptions.emailAddress eq emailAddress) and
                        (UserSubscriptions.serviceName eq serviceName)
            }

            // Check if the subscription was the only one of its category
            if (category != null) {
                val remainingSubscriptionsOfCategory = UserSubscriptions.select {
                    (UserSubscriptions.emailAddress eq emailAddress) and
                            (UserSubscriptions.serviceName inList Services.select {
                                Services.category eq category.toString()
                            }.map { it[Services.serviceName] })
                }.count()

                // If no more subscriptions of this category exist, delete corresponding recommendations
                if (remainingSubscriptionsOfCategory.toInt() == 0) {
                    Recommendations.deleteWhere {
                        (Recommendations.emailAddress eq emailAddress) and
                                (Recommendations.serviceName inList Services.select {
                                    Services.category eq category.toString()
                                }.map { it[Services.serviceName] })
                    }
                }
            }
        }
    }

    fun getSubscriptions(emailAddress: String): List<Subscription> {
        removeExpiredTrialSubscriptions(emailAddress)
        return transaction {
            UserSubscriptions
                .slice(UserSubscriptions.columns)
                .select { UserSubscriptions.emailAddress eq emailAddress }
                .orderBy(UserSubscriptions.endDate to SortOrder.ASC)
                .map { rowToSubscription(it) }
        }
    }

    fun getSubscriptionDetails(emailAddress: String, serviceName: String): Subscription? {
        return transaction {
            UserSubscriptions.select {
                (UserSubscriptions.emailAddress eq emailAddress) and
                        (UserSubscriptions.serviceName eq serviceName)
            }.mapNotNull { rowToSubscription(it) }
                .singleOrNull()
        }
    }

    private fun rowToSubscription(row: ResultRow): Subscription {
        return Subscription(
            emailAddress = row[UserSubscriptions.emailAddress],
            serviceName = row[UserSubscriptions.serviceName],
            type = row[UserSubscriptions.type],
            endDate = row[UserSubscriptions.endDate],
            price = row[UserSubscriptions.price]?.toDouble(),
            paymentFrequency = row[UserSubscriptions.paymentFrequency],
            planName = row[UserSubscriptions.planName]
        )
    }

    fun removeExpiredTrialSubscriptions(emailAddress: String) {
        val trimmedEmailAddress = emailAddress.trim()
        transaction {
            // Delete corresponding entries in the AppUsage table
            AppUsage.deleteWhere {
                (AppUsage.emailAddress eq trimmedEmailAddress) and
                        (AppUsage.serviceName inList UserSubscriptions
                            .select {
                                (UserSubscriptions.emailAddress eq trimmedEmailAddress) and
                                        (UserSubscriptions.type eq "Free trial") and
                                        (UserSubscriptions.endDate.less(LocalDate.now()))
                            }
                            .map { it[UserSubscriptions.serviceName] }
                                )
            }

            UserSubscriptions.deleteWhere {
                (UserSubscriptions.emailAddress eq trimmedEmailAddress) and
                        (UserSubscriptions.type eq "Free trial") and
                        (UserSubscriptions.endDate.less(LocalDate.now()))
            }
        }
    }

    fun getSubscriptionsNeedingNotification(emailAddress: String): List<Subscription> {
        val subscriptions = transaction {
            val currentDate = LocalDate.now()
            val endDateThreshold = currentDate.plusDays(1) // End date threshold is one day from current date
            UserSubscriptions.select {
                (UserSubscriptions.emailAddress.eq(emailAddress)) and
                        (UserSubscriptions.endDate.lessEq(endDateThreshold))
            }.map { rowToSubscription(it) }
        }
        return subscriptions
    }


}