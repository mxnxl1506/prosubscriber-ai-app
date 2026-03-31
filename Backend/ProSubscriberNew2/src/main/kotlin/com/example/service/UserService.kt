package com.example.service

import com.example.config.Recommendations
import com.example.config.Transactions
import com.example.config.UserSubscriptions
import com.example.config.Users
import com.example.config.AppUsage
import com.example.model.User
import org.jetbrains.exposed.sql.ResultRow
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.deleteWhere
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.select
import org.jetbrains.exposed.sql.selectAll
import org.jetbrains.exposed.sql.transactions.transaction
import org.jetbrains.exposed.sql.update
import java.time.LocalDate


class UserService{
    fun createProfile(name: String, gender: String, dob: LocalDate, emailAddress: String, isStudent: Boolean) {
        transaction {
            // Check if email address already exists
            val existingUser = Users.select { Users.emailAddress eq emailAddress }.count()
            if (existingUser > 0) {
                throw IllegalArgumentException("Email address already exists")
            }

            // Insert new user
            Users.insert {
                it[Users.name] = name
                it[Users.gender] = gender
                it[Users.dob] = dob
                it[Users.emailAddress] = emailAddress
                it[Users.isStudent] = isStudent
            }
        }
    }

    fun displayProfile(emailAddress: String): User? {
        val emailAddress = emailAddress.trim()
        return transaction {
            Users.select { Users.emailAddress eq emailAddress }
                .mapNotNull { rowToUser(it) }
                .singleOrNull()
        }
    }

    fun editProfile(name: String, gender: String, emailAddress: String, dob: LocalDate?, isStudent: Boolean) {
        transaction {
            // Update user profile
            Users.update({ Users.emailAddress eq emailAddress }) {
                it[Users.name] = name
                it[Users.gender] = gender
                it[Users.emailAddress] = emailAddress
                it[Users.dob] = dob
                it[Users.isStudent] = isStudent
            }
        }
    }

    fun deleteProfile(emailAddress: String) {
        transaction {
            AppUsage.deleteWhere { AppUsage.emailAddress eq emailAddress }
            Transactions.deleteWhere { Transactions.emailAddress eq emailAddress }
            Recommendations.deleteWhere { Recommendations.emailAddress eq emailAddress }
            UserSubscriptions.deleteWhere { UserSubscriptions.emailAddress eq emailAddress }
            Users.deleteWhere { Users.emailAddress eq emailAddress }
        }
    }

    fun emailExists(emailAddress: String): Boolean {
        return transaction {
            Users.select { Users.emailAddress eq emailAddress }
                .count() > 0
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


    fun getAllUsers(): List<User> {
        return transaction {
            Users.selectAll()
                .map { rowToUser(it) }
        }
    }
}