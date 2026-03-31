package com.example.routes

import com.example.service.UserService

import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.request.receive
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.delete
import io.ktor.server.routing.get
import io.ktor.server.routing.post
import io.ktor.server.routing.put
import io.ktor.server.routing.route
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException

fun Route.userRoutes(userService: UserService) {
    route("/user") {
        // Get details of an existing account
        get("/{emailAddress}") {
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@get
            }

            val user = userService.displayProfile(emailAddress)
            if (user == null) {
                call.respond(HttpStatusCode.NotFound, "User not found")
            } else {
                call.respond(HttpStatusCode.OK, user)
            }
        }

        // Create new user account
        post {
            val post = call.receive<Map<String, String>>()
            val name = post["name"] ?: ""
            val gender = post["gender"] ?: ""
            val dobString = post["dob"]
            val dob = try {
                LocalDate.parse(dobString, DateTimeFormatter.ofPattern("dd/MM/yyyy"))
            } catch (e: DateTimeParseException) {
                call.respond(HttpStatusCode.BadRequest, "Invalid date of birth format")
                return@post
            }
            val emailAddress = post["emailAddress"] ?: ""
            val isStudent = post["isStudent"]?.toBoolean() ?: false

            // Validate gender
            if (gender.length != 1) {
                call.respond(HttpStatusCode.BadRequest, "Invalid gender format")
                return@post
            }

            // Check if email address already exists
            if (userService.emailExists(emailAddress)) {
                call.respond(HttpStatusCode.BadRequest, "Email address already in use")
                return@post
            }

            // Create user profile
            userService.createProfile(name, gender, dob, emailAddress, isStudent)
            call.respond(HttpStatusCode.Created, "User account created successfully")
        }

        // Update user profile
        put("/{emailAddress}") {
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@put
            }

            // Check if email address exists before attempting to update
            val userExists = userService.emailExists(emailAddress)
            if (!userExists) {
                call.respond(HttpStatusCode.NotFound, "Email address does not exist")
                return@put
            }

            val post = call.receive<Map<String, String>>()
            val name = post["name"] ?: ""
            val gender = post["gender"] ?: ""
            val dobString = post["dob"]
            val dob = try {
                LocalDate.parse(dobString, DateTimeFormatter.ofPattern("dd/MM/yyyy"))
            } catch (e: DateTimeParseException) {
                call.respond(HttpStatusCode.BadRequest, "Invalid date of birth format")
                return@put
            }
            val isStudent = post["isStudent"]?.toBoolean() ?: false

            // Validate gender
            if (gender.length != 1) {
                call.respond(HttpStatusCode.BadRequest, "Invalid gender format")
                return@put
            }

            // Update user profile
            try {
                userService.editProfile(name, gender, emailAddress, dob, isStudent)
                call.respond(HttpStatusCode.OK, "Profile updated successfully")
            } catch (e: IllegalArgumentException) {
                call.respond(HttpStatusCode.BadRequest, e.message ?: "Error updating profile")
            }
        }
        // Delete user profile
        delete("/{emailAddress}") {
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@delete
            }

            userService.deleteProfile(emailAddress)
            call.respond(HttpStatusCode.OK, "User profile deleted successfully")
        }
    }
}