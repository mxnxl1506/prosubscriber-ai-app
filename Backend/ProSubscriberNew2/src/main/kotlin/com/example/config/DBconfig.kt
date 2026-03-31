package com.example.config

import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.javatime.date

object Users : Table("User") {
    val name = varchar("name_", length = 30).nullable()
    val gender = char("gender", length = 1).nullable()
    val dob = date("dob").nullable()
    val emailAddress = varchar("email_address", length = 30)
    val isStudent = bool("is_student").default(false)

    override val primaryKey = PrimaryKey(emailAddress)
}

object Services : Table("Services") {
    val serviceName = varchar("service_name", length = 40)
    val category = varchar("category", length = 20).nullable()
    val ratings = decimal("ratings", 5, 2).nullable()
    val googlePlayLink = varchar("googleplay_link", length = 200).nullable()

    override val primaryKey = PrimaryKey(serviceName)

}
object UserSubscriptions : Table("User_Subscriptions") {
    val emailAddress = varchar("email_address", length = 30) references Users.emailAddress
    val serviceName = varchar("service_name", length = 20) references Services.serviceName
    val type = varchar("type_", length = 20).nullable()
    val endDate = date("end_date").nullable()
    val price = double("price").nullable()
    val paymentFrequency = varchar("payment_frequency", length = 20).nullable()
    val planName = varchar("plan_name", length = 20).nullable()

    override val primaryKey = PrimaryKey(serviceName, emailAddress)
}

object Transactions : Table("Transactions") {
    val datePaid = date("date_paid")
    val amountPaid = float("amount_paid").nullable()
    val emailAddress = varchar("email_address", length = 30) references Users.emailAddress
    val serviceName = varchar("service_name", length = 20) references Services.serviceName

    override val primaryKey = PrimaryKey(serviceName, emailAddress, datePaid)
}

object AppUsage : Table("app_usage") {
    val emailAddress = varchar("email_address", length = 30) references Users.emailAddress
    val dateMeasured = date("date_measured")
    val serviceName = varchar("service_name", length = 20) references Services.serviceName
    val numHours = double("num_hours").nullable()

    override val primaryKey = PrimaryKey(emailAddress,serviceName, dateMeasured)
}

object Recommendations : Table("Recommendations") {
    val advantages = varchar("advantages", length = 50).nullable()
    val emailAddress = varchar("email_address", length = 30) references Users.emailAddress
    val serviceName = varchar("service_name", length = 20) references Services.serviceName
    val category = varchar("category", length = 20).nullable()


    override val primaryKey = PrimaryKey(serviceName, emailAddress)
}

object ServicePlans : Table("Service_Plans") {
    val serviceName = varchar("service_name", length = 20) references Services.serviceName
    val planName = varchar("plan_name", length = 40)
    val description = varchar("app_description", length = 100).nullable()
    val priceAED = double("priceAED").nullable()
    val paymentFrequency = varchar("payment_frequency", length = 20).nullable()

    override val primaryKey = PrimaryKey(serviceName, planName)
}



