package com.example.routes


import com.example.service.RecommendationService
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.get

fun Route.recommendationsRoute(recommendationService: RecommendationService) {

    get("/recommendations/{emailAddress}") {
        val emailAddress = call.parameters["emailAddress"]
        if (emailAddress == null) {
            call.respond(HttpStatusCode.BadRequest, "Invalid email address.")
            return@get
        }
        val recommendations = recommendationService.getRecommendations(emailAddress)
        call.respond(HttpStatusCode.OK, recommendations)
    }
}
