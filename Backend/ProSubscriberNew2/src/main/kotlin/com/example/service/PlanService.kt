package com.example.service


import com.example.config.ServicePlans
import com.example.config.Services
import com.example.model.Service
import com.example.model.ServicePlan
import org.jetbrains.exposed.sql.ResultRow
import org.jetbrains.exposed.sql.select
import org.jetbrains.exposed.sql.selectAll
import org.jetbrains.exposed.sql.transactions.transaction

class PlanService {

    fun getAppLink(serviceName: String): String? {
        return transaction {
            Services.select { Services.serviceName eq serviceName }
                .singleOrNull()?.get(Services.googlePlayLink)
        }
    }

    fun getServiceDetails(serviceName: String): Service? {
        return transaction {
            Services.select { Services.serviceName eq serviceName }
                .map { rowToService(it) }
                .singleOrNull() // Return a single object or null
        }
    }

    fun getAllServiceNames(): List<Map<String, String>> {
        return transaction {
            Services.selectAll().map {
                mapOf("serviceName" to it[Services.serviceName])
            }
        }
    }

    private fun rowToService(row: ResultRow): Service {
        return Service(
            serviceName = row[Services.serviceName],
            category = row[Services.category],
            ratings = row[Services.ratings]?.toDouble(),
            googlePlayLink = row[Services.googlePlayLink]
        )
    }
    fun getServicePlan(serviceName: String): List<ServicePlan> {
        return transaction {
            ServicePlans.select { ServicePlans.serviceName eq serviceName }
                .map { rowToServicePlan(it) }
        }
    }

    private fun rowToServicePlan(row: ResultRow): ServicePlan {
        return ServicePlan(
            serviceName = row[ServicePlans.serviceName],
            planName = row[ServicePlans.planName],
            description = row[ServicePlans.description],
            price = row[ServicePlans.priceAED]?.toDouble(),
            paymentFrequency = row[ServicePlans.paymentFrequency]
        )
    }
}