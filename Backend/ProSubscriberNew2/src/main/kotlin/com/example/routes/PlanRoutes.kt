package com.example.routes

import com.example.service.PlanService
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.get
import io.ktor.server.routing.route
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json


fun Route.planRoutes(planService: PlanService) {
    route("/plans") {
        // Get Google Play link for a service
        get("/googleplay/{serviceName}") {
            val serviceName = call.parameters["serviceName"] ?: ""
            val googlePlayLink = planService.getAppLink(serviceName)
            if (googlePlayLink != null) {
                call.respond(googlePlayLink)
            } else {
                call.respond(HttpStatusCode.NotFound, "Google Play link not found for service: $serviceName")
            }
        }

        // Get service details
        get("/{serviceName}") {
            val serviceName = call.parameters["serviceName"] ?: ""
            val serviceDetails = planService.getServiceDetails(serviceName)
            if (serviceDetails != null) {
                call.respond(HttpStatusCode.OK, serviceDetails)
            } else {
                call.respond(HttpStatusCode.NotFound, "Service details not found for service: $serviceName")
            }
        }

        // Get all service names
        get("/all") {
            val allServiceNames = planService.getAllServiceNames()
            val json = Json.encodeToString(allServiceNames)
            call.respond(HttpStatusCode.OK, json)
        }

        // Get service plans
        get("/all/{serviceName}") {
            val serviceName = call.parameters["serviceName"] ?: ""
            val servicePlans = planService.getServicePlan(serviceName)
            if (servicePlans.isNotEmpty()) {
                call.respond(HttpStatusCode.OK, servicePlans)
            } else {
                call.respond(HttpStatusCode.NotFound, "Service plans not found for service: $serviceName")
            }
        }
    }
}