import UIKit
import Flutter
import GoogleMaps
import Firebase
import ScreenshotPreventing

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    weak var screen : UIView? = nil
    let container = ScreenshotPreventingView()

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      screen = UIScreen.main.snapshotView(afterScreenUpdates: false)

      FirebaseApp.configure()
      container.setup(contentView: screen!)

    GMSServices.provideAPIKey("AIzaSyC6vGIyIwOA5xR8WgM3-aG3qG3g43Ie8Zs")
      GeneratedPluginRegistrant.register(with: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


}
