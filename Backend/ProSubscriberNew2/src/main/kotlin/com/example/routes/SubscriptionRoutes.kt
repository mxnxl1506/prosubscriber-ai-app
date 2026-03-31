package com.example.routes

import com.example.service.SubscriptionService
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.request.receive
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.delete
import io.ktor.server.routing.get
import io.ktor.server.routing.post
import io.ktor.server.routing.route
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException

fun Route.subscriptionRoutes(subscriptionService: SubscriptionService) {
    route("/subscription") {
        // Add a new subscription
        post {
            val post = call.receive<Map<String, String>>()
            val emailAddress = post["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@post
            }
            val serviceName = post["serviceName"] ?: ""
            val type = post["type"] ?: ""
            val endDate = post["endDate"]?.let {
                try {
                    LocalDate.parse(it, DateTimeFormatter.ofPattern("dd/MM/yyyy"))
                } catch (e: DateTimeParseException) {
                    call.respond(HttpStatusCode.BadRequest, "Invalid end date format")
                    return@post
                }
            } ?: return@post call.respond(HttpStatusCode.BadRequest, "End date is missing")
            val price = post["price"]?.toDoubleOrNull()
                ?: return@post call.respond(HttpStatusCode.BadRequest, "Invalid price")
            val paymentFrequency = post["paymentFrequency"] ?: ""
            val planName = post["planName"] ?: ""

            try {
                subscriptionService.addSubscription(
                    emailAddress,
                    serviceName,
                    type,
                    endDate,
                    price,
                    paymentFrequency,
                    planName
                )
                call.respond(HttpStatusCode.Created, "Subscription added successfully")
            } catch (e: IllegalArgumentException) {
                call.respond(
                    HttpStatusCode.BadRequest,
                    e.message ?: "Error adding subscription"
                )
            }
        }
        post("/custom") {
            val post = call.receive<Map<String, String>>()
            val emailAddress = post["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@post
            }
            val serviceName = post["serviceName"] ?: ""
            val type = post["type"] ?: ""
            val endDate = post["endDate"]?.let {
                try {
                    LocalDate.parse(it, DateTimeFormatter.ofPattern("dd/MM/yyyy"))
                } catch (e: DateTimeParseException) {
                    call.respond(HttpStatusCode.BadRequest, "Invalid end date format")
                    return@post
                }
            } ?: return@post call.respond(HttpStatusCode.BadRequest, "End date is missing")
            val price = post["price"]?.toDoubleOrNull()
                ?: return@post call.respond(HttpStatusCode.BadRequest, "Invalid price")
            val paymentFrequency = post["paymentFrequency"] ?: ""
            val planName = post["planName"] ?: ""
            try {
                subscriptionService.addCustomSubscription(
                    emailAddress,
                    serviceName,
                    type,
                    endDate,
                    price,
                    paymentFrequency,
                    planName
                )
                call.respond(HttpStatusCode.Created, "Custom subscription added successfully")
            } catch (e: IllegalArgumentException) {
                call.respond(
                    HttpStatusCode.BadRequest,
                    e.message ?: "Error adding custom subscription"
                )
            }
        }
        // Remove a subscription
        delete("/{emailAddress}/{serviceName}") {
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@delete
            }
            val serviceName = call.parameters["serviceName"] ?: ""
            subscriptionService.removeSubscription(emailAddress, serviceName)
            call.respond(HttpStatusCode.OK, "Subscription removed successfully")
        }

        // Get subscriptions of a user
        get("/{emailAddress}") {
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@get
            }
            val subscriptions = subscriptionService.getSubscriptions(emailAddress)
            call.respond(HttpStatusCode.OK, subscriptions)
        }
        // Get subscription details
        get("/{emailAddress}/{serviceName}") {
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@get
            }
            val serviceName = call.parameters["serviceName"] ?: ""
            val subscription = subscriptionService.getSubscriptionDetails(emailAddress, serviceName)
            if (subscription != null) {
                call.respond(HttpStatusCode.OK, subscription)
            } else {
                call.respond(HttpStatusCode.NotFound, "Subscription not found")
            }
        }
    }
}