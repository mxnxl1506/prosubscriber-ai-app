package com.example.service

import com.example.config.Transactions
import com.example.config.UserSubscriptions
import com.example.config.Users
import com.example.model.Subscription
import com.example.model.Transaction
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.transactions.transaction
import java.time.LocalDate

class TransactionService {

    fun getTransactions(emailAddress: String): List<Transaction> {
        val trimmedEmailAddress = emailAddress.trim()
        addTransaction(trimmedEmailAddress)
        return transaction {
            Transactions
                .slice(Transactions.columns)
                .select { Transactions.emailAddress eq trimmedEmailAddress }
                .orderBy(Transactions.datePaid to SortOrder.ASC)
                .map { rowToTransaction(it) }
        }
    }

    fun addTransaction(emailAddress: String) {
        val emailAddress = emailAddress.trim()
        transaction {
            // Check if the user exists
            val userExists = Users.select { Users.emailAddress eq emailAddress }.count() > 0

            if (userExists) {
                // Add transactions for subscriptions
                UserSubscriptions.select { UserSubscriptions.emailAddress eq emailAddress }.forEach {
                    val subscription = rowToSubscription(it)
                    val currentDate = LocalDate.now()
                    if (subscription.endDate != null && currentDate.isAfter(subscription.endDate)) {
                        val newEndDate = when (subscription.paymentFrequency) {
                            "Yearly" -> subscription.endDate.plusYears(1)
                            "Monthly" -> subscription.endDate.plusMonths(1)
                            "Weekly" -> subscription.endDate.plusWeeks(1)
                            "Bi-weekly" -> subscription.endDate.plusWeeks(2)
                            "3 months" -> subscription.endDate.plusMonths(3)
                            "6 months" -> subscription.endDate.plusMonths(6)
                            else -> subscription.endDate // Default to existing end date if frequency is unknown
                        }
                        UserSubscriptions.update({ (UserSubscriptions.emailAddress eq emailAddress) and (UserSubscriptions.serviceName eq subscription.serviceName) }) {
                            it[UserSubscriptions.endDate] = newEndDate
                        }
                        // Create Transaction
                        val transaction = Transaction(
                            datePaid = subscription.endDate, // Original end date
                            amountPaid = subscription.price?.toFloat(),
                            emailAddress = emailAddress,
                            serviceName = subscription.serviceName
                        )
                        // Insert transaction into Transactions table
                        Transactions.insert {
                            it[Transactions.emailAddress] = emailAddress
                            it[Transactions.serviceName] = subscription.serviceName
                            it[Transactions.datePaid] = transaction.datePaid
                            it[Transactions.amountPaid] = transaction.amountPaid
                        }
                    }
                }
            } else {
                throw IllegalArgumentException("User does not exist")
            }
        }
    }

    fun getTransactionDetails(emailAddress: String, serviceName: String): List<Transaction> {
        return transaction {
            Transactions.select {
                (Transactions.emailAddress eq emailAddress) and (Transactions.serviceName eq serviceName)
            }.map { rowToTransaction(it) }
        }
    }

    private fun rowToTransaction(row: ResultRow): Transaction {
        return Transaction(
            datePaid = row[Transactions.datePaid],
            amountPaid = row[Transactions.amountPaid]?.toFloat(),
            emailAddress = row[Transactions.emailAddress],
            serviceName = row[Transactions.serviceName]
        )
    }

    private fun rowToSubscription(row: ResultRow): Subscription {
        return Subscription(
            emailAddress = row[UserSubscriptions.emailAddress],
            serviceName = row[UserSubscriptions.serviceName],
            type = row[UserSubscriptions.type],
            endDate = row[UserSubscriptions.endDate],
            price = row[UserSubscriptions.price],
            paymentFrequency = row[UserSubscriptions.paymentFrequency],
            planName = row[UserSubscriptions.planName]
        )
    }
}
