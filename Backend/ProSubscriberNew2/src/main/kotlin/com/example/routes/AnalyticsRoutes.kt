package com.example.routes


import com.example.service.AnalyticsService
import io.ktor.http.*
import io.ktor.server.application.call
import io.ktor.server.response.respond
import io.ktor.server.routing.*

fun Route.analyticsRoutes(analyticsService: AnalyticsService){
    route("/usage")
    {
        get("/displayUsage/{serviceName}/{emailAddress}"){
            val serviceName = call.parameters["serviceName"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid serviceName")
                return@get
            }
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@get
            }
            val subscriptions = analyticsService.displayUsage(emailAddress, serviceName)
            call.respond(HttpStatusCode.OK, subscriptions)
        }
        get("/suggestCancellation/{serviceName}/{emailAddress}") {
            val serviceName = call.parameters["serviceName"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid serviceName")
                return@get
            }
            val emailAddress = call.parameters["emailAddress"] ?: run {
                call.respond(HttpStatusCode.BadRequest, "Invalid email address")
                return@get
            }
            call.respond(analyticsService.suggestCancellation(serviceName,emailAddress))
        }
        }
}

