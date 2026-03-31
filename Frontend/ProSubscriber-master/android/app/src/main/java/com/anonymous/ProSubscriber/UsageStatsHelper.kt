package com.anonymous.ProSubscriber

import android.app.AppOpsManager
import android.app.usage.UsageEvents
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Process
import android.provider.Settings
import android.util.Log

class UsageStatsHelper(private val context: Context) {

    fun checkUsageStatsPermission(): Boolean {
        //Log.d(TAG, "checking permission")
        val appOpsManager = context.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode =
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    appOpsManager.unsafeCheckOpNoThrow(
                            "android:get_usage_stats",
                            Process.myUid(),
                            context.packageName
                    )
                } else {
                    appOpsManager.checkOpNoThrow(
                            "android:get_usage_stats",
                            Process.myUid(),
                            context.packageName
                    )
                }
        return mode == AppOpsManager.MODE_ALLOWED
    }

    fun fetchAndLogUsageStats() {
        //Log.d(TAG, "fetching")
        val usageStatsManager =
                context.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val currentTime = System.currentTimeMillis()
        val usageEvents = usageStatsManager.queryEvents(currentTime - 600000, currentTime)
        val usageEvent = UsageEvents.Event()

        while (usageEvents.hasNextEvent()) {
            usageEvents.getNextEvent(usageEvent)
            Log.e("APP", "${usageEvent.packageName} ${usageEvent.timeStamp}")
        }
    }

    fun navigateToPermissionSettings() {
        //Log.d(TAG, "go to settings")
        Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS).apply { context.startActivity(this) }
    }
}
