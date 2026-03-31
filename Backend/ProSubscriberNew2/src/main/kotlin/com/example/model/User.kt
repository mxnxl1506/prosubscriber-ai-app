package com.example.model

import kotlinx.serialization.Serializable
import java.time.LocalDate

@Serializable
data class User(
    val name: String?,
    val gender: String?,
    @Serializable(with = LocalDateSerializer::class)
    val dob: LocalDate?,
    val emailAddress: String,
    val isStudent: Boolean
)
