package com.anonymous.ProSubscriber

//import com.facebook.react.BuildConfig
import android.app.AppOpsManager
import android.app.usage.UsageEvents
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.os.Process
import android.provider.Settings
import android.util.Log
import com.facebook.react.*
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.fabricEnabled
import com.facebook.react.defaults.DefaultReactActivityDelegate
import expo.modules.ReactActivityDelegateWrapper


class MainActivity : ReactActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    setTheme(R.style.AppTheme)
    super.onCreate(null)

  }

  override fun getMainComponentName(): String = "main"

  override fun createReactActivityDelegate(): ReactActivityDelegate {
    return ReactActivityDelegateWrapper(
        this,
        BuildConfig.IS_NEW_ARCHITECTURE_ENABLED,
        object : DefaultReactActivityDelegate(this, mainComponentName, fabricEnabled) {}
    )
  }

  override fun invokeDefaultOnBackPressed() {
    super.invokeDefaultOnBackPressed() // Your existing onBackPressed implementation
  }

  
}
