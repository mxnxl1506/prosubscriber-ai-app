package com.example.model

import kotlinx.serialization.Serializable

@Serializable
data class Recommendation(
    val advantages: String?,
    val emailAddress: String,
    val serviceName: String,
    val category: String?
)
