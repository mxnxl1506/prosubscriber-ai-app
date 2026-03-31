package com.example.service


import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import java.io.IOException

class FlaskAPIClient {

    private val client = OkHttpClient()

    fun post(url: String, json: String): String? {
        val body = json.toRequestBody("application/json".toMediaType())
        val request = Request.Builder()
            .url(url)
            .post(body)
            .build()

        return try {
            val response = client.newCall(request).execute()
            response.body?.string()
        } catch (e: IOException) {
            e.printStackTrace()
            null
        }
    }
}