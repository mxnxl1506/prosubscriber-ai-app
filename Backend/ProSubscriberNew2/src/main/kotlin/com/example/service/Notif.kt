package com.example.service

import com.example.model.Subscription
import com.google.firebase.messaging.FirebaseMessaging
import com.google.firebase.messaging.Message
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.time.LocalDate

class Notif {

    private val recommendationService = RecommendationService()
    private val subscriptionService = SubscriptionService(recommendationService)
    private val userService = UserService()

    private var job: Job? = null

    // Function to schedule notifications
    fun scheduleNotifications() {
        // Start a coroutine to send notifications at regular intervals
        job = GlobalScope.launch {
            while (true) {
                delay(24 * 60 * 60 * 1000) // Delay for 24 hours
                sendNotificationsToUsersWithExpiringSubscriptions()
            }
        }
    }

    // Function to send notifications to users with expiring subscriptions
    suspend fun sendNotificationsToUsersWithExpiringSubscriptions() {
        val allUsers = userService.getAllUsers()

        allUsers.forEach { user ->
            val emailAddress = user.emailAddress
            val topic = "subscription_$emailAddress"
            val subscriptions = subscriptionService.getSubscriptionsNeedingNotification(emailAddress)

            subscriptions.forEach { subscription ->
                val title = "Subscription Ending Soon"
                val body = generateNotificationMessage(subscription)

                sendPushNotificationToTopic(topic, title, body)
            }
        }
    }

    private fun generateNotificationMessage(subscription: Subscription): String {
        val currentDate = LocalDate.now()
        val endDate = subscription.endDate ?: return ""
        val daysUntilEnd = currentDate.until(endDate).days
        return if (daysUntilEnd == 1) {
            if (subscription.type == "Free trial") {
                "Cancel the free trial for ${subscription.serviceName} before it ends tomorrow."
            } else {
                "Cancel your subscription for ${subscription.serviceName} before it ends tomorrow."
            }
        } else {
            ""
        }
    }

    private fun sendPushNotificationToTopic(topic: String, title: String, body: String) {
        val message = Message.builder()
            .putData("title", title)
            .putData("body", body)
            .setTopic(topic)
            .build()

        GlobalScope.launch {
            try {
                FirebaseMessaging.getInstance().send(message)
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }

    // Function to cancel the scheduled task if needed
    fun cancelScheduledNotifications() {
        job?.cancel()
    }
}