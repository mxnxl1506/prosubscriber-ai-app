package com.example.service

import com.example.config.Recommendations
import com.example.config.Services
import com.example.config.UserSubscriptions
import com.example.config.Users
import com.example.model.Recommendation
import com.example.model.Subscription
import com.example.model.User
import org.jetbrains.exposed.sql.ResultRow
import org.jetbrains.exposed.sql.select
import org.jetbrains.exposed.sql.transactions.transaction
import java.time.LocalDate
import java.time.Period

class RecommendationService {

    private val flaskAPIClient = FlaskAPIClient()

    fun generateRecommendation(emailAddress: String) {
        // Fetch user details from the database
        val user = getUserDetails(emailAddress)
        if (user != null) {
            val subscriptions = getUserSubscriptions(emailAddress)
            for (subscription in subscriptions) {
                val category = getCategoryForService(subscription.serviceName)
                if (category != null) {
                    val (gender, ageGroup, isStudent) = getUserAttributes(user)
                    val url = "http://localhost:8084/predict"
                    val json =
                        "{\"email_address\":\"$emailAddress\",\"age_group\":$ageGroup,\"gender\":\"$gender\",\"current_category\":\"$category\",\"is_student\":$isStudent}"
                    // Call the Flask API with the JSON data
                    flaskAPIClient.post(url, json)
                } else {
                    println("Category not found for service: ${subscription.serviceName}")
                }
            }
        } else {
            println("User with ID $emailAddress not found.")
        }
    }

    private fun getUserSubscriptions(emailAddress: String): List<Subscription> {
        val emailAddress = emailAddress.trim()
        return transaction {
            UserSubscriptions.select { UserSubscriptions.emailAddress eq emailAddress }
                .map { rowToSubscription(it) }
        }
    }

    private fun getCategoryForService(serviceName: String): String? {
        return transaction {
            Services.select { Services.serviceName eq serviceName }
                .singleOrNull()?.get(Services.category)
        }
    }

    fun getRecommendations(emailAddress: String): List<Recommendation> {
        return transaction {
            Recommendations.select { Recommendations.emailAddress eq emailAddress }
                .map { rowToRecommendation(it) }
        }
    }

    private fun rowToRecommendation(row: ResultRow): Recommendation {
        return Recommendation(
            advantages = row[Recommendations.advantages],
            emailAddress = row[Recommendations.emailAddress],
            serviceName = row[Recommendations.serviceName],
            category = row[Recommendations.category]
        )
    }

    private fun getUserDetails(emailAddress: String): User? {
        val emailAddress = emailAddress.trim()
        return transaction {
            Users.select { Users.emailAddress eq emailAddress }
                .mapNotNull { rowToUser(it) }
                .singleOrNull() // Return a single object or null
        }
    }

    private fun rowToUser(row: ResultRow): User {
        return User(
            name = row[Users.name],
            gender = row[Users.gender],
            dob = row[Users.dob],
            emailAddress = row[Users.emailAddress],
            isStudent = row[Users.isStudent]
        )
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


    private fun getUserAttributes(user: User): Triple<String?, Int?, Boolean> {
        val gender = user.gender
        val ageGroup = user.dob?.let { calculateAge(it) }
        val isStudent = user.isStudent
        return Triple(gender, ageGroup, isStudent)
    }

    private fun calculateAge(dob: LocalDate): Int {
        val currentDate = LocalDate.now()
        val age = Period.between(dob, currentDate).years
        return age
    }
}