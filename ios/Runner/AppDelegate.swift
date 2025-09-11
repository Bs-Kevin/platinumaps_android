import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Register the platform view
    guard let pluginRegistrar = self.registrar(forPlugin: "pm-webview")
    else {
      return false
    }

    let factory = PmWebViewNativeFactory()
    pluginRegistrar.register(
      factory,
      withId: "com.example.platinumaps_app/pm-webview"
    )

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
