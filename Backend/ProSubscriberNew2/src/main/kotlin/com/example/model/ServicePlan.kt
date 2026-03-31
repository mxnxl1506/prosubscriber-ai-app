package com.example.model

import kotlinx.serialization.Serializable

@Serializable
data class ServicePlan(
    val serviceName: String,
    val planName: String,
    val description: String?,
    val price: Double?,
    val paymentFrequency: String?
)
