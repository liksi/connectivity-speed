package com.ouestfrance.plugins.connectivity_speed

import android.net.ConnectivityManager
import android.net.NetworkInfo
import android.telephony.TelephonyManager
import android.content.Context

import androidx.annotation.NonNull
import androidx.annotation.Nullable

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** ConnectivitySpeedPlugin */
class ConnectivitySpeedPlugin: FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel : MethodChannel
    private lateinit var connectivityManager: ConnectivityManager

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "connectivity_speed")
        connectivityManager = flutterPluginBinding.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "subtype") {
            result.success(getNetworkSubType())
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    @Nullable
    fun getNetworkSubType(): String? {
        val info = this.connectivityManager.getActiveNetworkInfo()
        return if (info == null || !info.isConnected()) {
            null
        } else when (info.getSubtype()) {
            TelephonyManager.NETWORK_TYPE_1xRTT -> {
                "1xRTT" // ~ 50-100 kbps
            }
            TelephonyManager.NETWORK_TYPE_CDMA -> {
                "cdma" // ~ 14-64 kbps
            }
            TelephonyManager.NETWORK_TYPE_EDGE -> {
                "edge" // ~ 50-100 kbps
            }
            TelephonyManager.NETWORK_TYPE_EVDO_0 -> {
                "evdo_0" // ~ 400-1000 kbps
            }
            TelephonyManager.NETWORK_TYPE_EVDO_A -> {
                "evdo_a" // ~ 600-1400 kbps
            }
            TelephonyManager.NETWORK_TYPE_GPRS -> {
                "gprs" // ~ 100 kbps
            }
            TelephonyManager.NETWORK_TYPE_HSDPA -> {
                "hsdpa" // ~ 2-14 Mbps
            }
            TelephonyManager.NETWORK_TYPE_HSPA -> {
                "hspa" // ~ 700-1700 kbps
            }
            TelephonyManager.NETWORK_TYPE_HSUPA -> {
                "hsupa" // ~ 1-23 Mbps
            }
            TelephonyManager.NETWORK_TYPE_UMTS -> {
                "umts" // ~ 400-7000 kbps
            }
            TelephonyManager.NETWORK_TYPE_EHRPD -> {
                // API level 11
                "ehrpd" // ~ 1-2 Mbps
            }
            TelephonyManager.NETWORK_TYPE_EVDO_B -> {
                // API level 9
                "evdo_b" // ~ 5 Mbps
            }
            TelephonyManager.NETWORK_TYPE_HSPAP -> {
                // API level 13
                "hspap" // ~ 10-20 Mbps
            }
            TelephonyManager.NETWORK_TYPE_IDEN -> {
                // API level 8
                "iden" // ~25 kbps
            }
            TelephonyManager.NETWORK_TYPE_LTE -> {
                // API level 11
                "lte" // ~ 10+ Mbps
            }
            TelephonyManager.NETWORK_TYPE_UNKNOWN -> {
                "unknown" // is connected but cannot tell the speed
            }
            else -> {
                null
            }
        }
    }
}
