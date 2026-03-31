package com.example.routes

import com.example.service.Notif
import io.ktor.server.application.call
import io.ktor.server.response.*
import io.ktor.server.routing.Route
import io.ktor.server.routing.post


fun Route.notifRoutes() {
    post("/send-notifications") {
        // Call the method to send notifications
        Notif().sendNotificationsToUsersWithExpiringSubscriptions()

        call.respondText("Notifications sent successfully")
    }
}