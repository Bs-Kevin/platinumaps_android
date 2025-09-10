package com.example.platinumaps_app

import android.content.Context
import android.nfc.Tag
import android.util.Log
import android.view.View
import android.view.inputmethod.InputMethodManager
import io.flutter.plugin.platform.PlatformView
import jp.co.boldright.platinumaps.sdk.PmWebView

internal class PmWebViewPlatformView(
   private val context: Context,
    creationParams: Map<*, *>?,
) : PlatformView {
    private val webView: PmWebView by lazy {
        PmWebView(context).also { webView ->
            val pmPath = creationParams?.get("pm_path") as? String ?: ""
            webView.openPlatinumaps(
                        jp.co.boldright.platinumaps.sdk.PmMapOptions(
                            mapPath = pmPath,
                            queryParams = null,
                            safeAreaTop = 0,
                            safeAreaBottom = 0,
                            beacon = null
                        )
                    )
        }
    }

    override fun getView(): View? {
        return webView
    }

    override fun dispose() {
        webView.destroy()
    }
}