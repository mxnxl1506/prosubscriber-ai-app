package com.anonymous.ProSubscriber

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.module.annotations.ReactModule
import expo.modules.core.Promise

@ReactModule(name = "UsageStatsModule")
class UsageStatsModule(reactContext: ReactApplicationContext) :
        ReactContextBaseJavaModule(reactContext) {
    private val usageStatsHelper = UsageStatsHelper(reactContext)

    override fun getName(): String {
        return "UsageStatsModule"
    }

    @ReactMethod
    fun testMethod(promise: Promise) {
        promise.resolve("Test successful")
    }

    @ReactMethod
    fun checkUsageStatsPermission(promise: com.facebook.react.bridge.Promise) {
        val hasPermission = usageStatsHelper.checkUsageStatsPermission()
        promise.resolve(hasPermission)
    }

    @ReactMethod
    fun fetchAndLogUsageStats() {
        usageStatsHelper.fetchAndLogUsageStats()
    }

    @ReactMethod
    fun navigateToPermissionSettings() {
        usageStatsHelper.navigateToPermissionSettings()
    }
}
