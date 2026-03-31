package com.example.model


import kotlinx.serialization.Serializable

@Serializable
data class Service(
    val serviceName: String,
    val category: String?,
    val ratings: Double?,
    val googlePlayLink: String?
)
