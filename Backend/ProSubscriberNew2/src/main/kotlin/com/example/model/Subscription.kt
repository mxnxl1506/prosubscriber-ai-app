package com.example.model

import kotlinx.serialization.Serializable
import java.time.LocalDate

@Serializable
data class Subscription(
    val emailAddress: String,
    val serviceName: String,
    val type: String?,
    @Serializable(with = LocalDateSerializer::class)
    val endDate: LocalDate?,
    val price: Double?,
    val paymentFrequency: String?,
    val planName: String?
)
