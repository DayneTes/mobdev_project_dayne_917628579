import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

  GMSServices.provideAPIKey("AIzaSyC-fsPEIMZXL6R7BRehD0I6iWp68qUATNI")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
