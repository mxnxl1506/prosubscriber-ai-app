package com.example.model

import kotlinx.serialization.Serializable
import java.time.LocalDate
@Serializable
data class Transaction(
    @Serializable(with = LocalDateSerializer::class)
    val datePaid: LocalDate,
    val amountPaid: Float?,
    val emailAddress: String,
    val serviceName: String
)
