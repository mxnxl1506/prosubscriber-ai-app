package com.example.model

import kotlinx.serialization.Serializable
import java.time.LocalDate

@Serializable
data class AppUsages(
    @Serializable(with = LocalDateSerializer::class)
    val dateMeasured: LocalDate,
    val emailAddress: String,
    val serviceName: String,
    val numHours: Double?
)

