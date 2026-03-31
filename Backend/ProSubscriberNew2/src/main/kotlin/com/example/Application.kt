rpackage com.example

import com.example.plugins.*
import io.ktor.server.application.*

import com.example.plugins.configureDatabases
import com.example.plugins.configureMonitoring
import com.example.plugins.configureRouting
import com.example.plugins.configureSerialization
import com.example.service.Notif
import com.google.auth.oauth2.GoogleCredentials
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import io.ktor.server.application.Application
import io.ktor.server.engine.embeddedServer
import io.ktor.server.netty.Netty
import java.io.File
import java.io.FileInputStream


fun main() {
    try {
        embeddedServer(Netty, port = 8080, module = Application::module)
            .start(wait = true)
    } catch (e: Exception) {
        println("Error starting server: ${e.message}")
        e.printStackTrace()
    }
}

fun Application.module() {
    configureMonitoring()
    configureSerialization()
    configureDatabases()
    configureRouting()
    //installFCMRoute()

    val serviceAccount = this::class.java.classLoader.getResourceAsStream("service_account_key.json")

    val options = FirebaseOptions.builder()
        .setCredentials(GoogleCredentials.fromStream(serviceAccount))
        .build()

    FirebaseApp.initializeApp(options)

    Notif().scheduleNotifications()


}




