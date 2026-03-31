package com.example.plugins

import com.example.routes.*
import com.example.service.*
import io.ktor.http.ContentType
import io.ktor.server.application.Application
import io.ktor.server.application.call
import io.ktor.server.response.respondText
import io.ktor.server.routing.get
import io.ktor.server.routing.routing

fun Application.configureRouting() {
    routing {
        userRoutes(UserService())
        planRoutes(PlanService())
        subscriptionRoutes(SubscriptionService(RecommendationService()))
        transactionRoutes(TransactionService())
        recommendationsRoute(RecommendationService())
        analyticsRoutes(AnalyticsService())
        notifRoutes()

        // Define a route for the root path
        get("/") {
            call.respondText("ProSubscriberApp is running", ContentType.Text.Plain)
        }
    }
}