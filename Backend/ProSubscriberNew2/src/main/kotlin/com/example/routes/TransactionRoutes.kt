package com.example.routes

import com.example.service.TransactionService
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.get
import io.ktor.server.routing.route

fun Route.transactionRoutes(transactionService: TransactionService) {
    route("/transaction") {
        // Get transactions for a user
        get("/{emailAddress}") {
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@get
            }

            val transactions = transactionService.getTransactions(emailAddress)
            call.respond(HttpStatusCode.OK, transactions)
        }

        // Get transaction details for a user and service
        get("/{emailAddress}/{serviceName}") {
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@get
            }
            val serviceName = call.parameters["serviceName"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid service name")
                return@get
            }

            val transactions = transactionService.getTransactionDetails(emailAddress, serviceName)
            call.respond(HttpStatusCode.OK, transactions)
        }
    }
}