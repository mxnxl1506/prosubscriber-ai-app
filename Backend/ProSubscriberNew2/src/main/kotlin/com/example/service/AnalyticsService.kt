package com.example.service


//import android.app.usage.UsageStatsManager
//import android.content.Context
//import android.os.Build
//import androidx.annotation.RequiresApi
import java.time.Instant
import java.time.ZoneId
import java.time.LocalDate
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.and
import org.jetbrains.exposed.sql.select
import com.example.config.AppUsage
import com.example.model.AppUsages
import org.jetbrains.exposed.sql.transactions.transaction
import org.jetbrains.exposed.sql.select
import org.jetbrains.exposed.sql.sum


class AnalyticsService {

    fun displayUsage(emailAddress: String,serviceName: String): List<AppUsages> {

        return transaction {
            AppUsage.select { (AppUsage.serviceName eq serviceName) and
                    (AppUsage.emailAddress eq emailAddress) }
                .map {
                    AppUsages(
                        emailAddress = it[AppUsage.emailAddress],
                        dateMeasured = it[AppUsage.dateMeasured],
                        serviceName = it[AppUsage.serviceName],
                        numHours = it[AppUsage.numHours]
                    )
                }
        }
    }

    fun suggestCancellation(serviceName: String, emailAddress: String): Boolean {
        val twoWeeksAgo = LocalDate.now().minusWeeks(2) // Calculating the date for 2 weeks ago

        val totalHours = transaction {
            AppUsage.slice(AppUsage.numHours.sum())
                .select {
                    (AppUsage.serviceName eq serviceName) and
                            (AppUsage.emailAddress eq emailAddress)
//                    and
//                            (AppUsage.dateMeasured greaterEq twoWeeksAgo)
                }
                .mapNotNull { it[AppUsage.numHours.sum()] }
                .singleOrNull() ?: 0
        }

        // Returns true if the usage for the app in the past two weeks is zero
        // True here means yes, cancellation should be suggested for this service
        if(totalHours == 0.0)
            {return true}
        else
            {return false}
    }

}

