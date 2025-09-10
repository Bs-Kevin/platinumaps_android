package com.example.platinumaps_app

import android.content.Context
import android.app.Activity
import android.util.Log
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import java.lang.ref.WeakReference

private const val TAG = "NativePmWebViewFactory"

class NativePmWebViewFactory(): PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val context = findActivityContext(context)
        val creationParams = args as? Map<*, *>
        return PmWebViewPlatformView(context, creationParams)
    }

    // Helper function to find an Activity context from a given Context
    // PmWebView relies on an Activity for certain features like permission requests
    private fun findActivityContext(context: Context): Context {
        var current = context
        while (current is android.content.ContextWrapper) {
            if (current is Activity) {
                Log.d(TAG, "Found Activity context: $current")
                return current
            }
            current = current.baseContext
        }
        Log.w(TAG, "Activity context not found, using provided context. Permission requests may not work as expected.")
        return context
    }
}