import UIKit
import Flutter
import GoogleMaps
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    weak var screen : UIView? = nil

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure()

    GMSServices.provideAPIKey("AIzaSyC6vGIyIwOA5xR8WgM3-aG3qG3g43Ie8Zs")
    GeneratedPluginRegistrant.register(with: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    
    override func applicationWillResignActive(
         _ application: UIApplication
       ) {
           blurScreen()
       }
       override func applicationDidBecomeActive(
         _ application: UIApplication
       ) {
           removeBlurScreen()
       }

       
       private func listenToTakeScreenRecording() {
           if #available(iOS 11.0, *) {
               NotificationCenter.default.addObserver(
                 forName: UIScreen.capturedDidChangeNotification,
                 object: nil,
                 queue: .main) { notification in
             
                     DispatchQueue.main.async {
                         if self.window?.isHidden == false{
                             self.hideScreen()
                         }
                         
                     }
                 }
           } else {
           }
       }
       
       private func listenToTakeScreenshot() {
           NotificationCenter.default.addObserver(
             forName: UIApplication.userDidTakeScreenshotNotification,
             object: nil,
             queue: .main) { notification in
                 
                 if self.window?.isHidden == false{
                     self.blurScreen();
                 }
               }
       }
       
       private func hideScreen() {
           if #available(iOS 11.0, *) {
               if UIScreen.main.isCaptured {
                   self.blurScreen();
               } else {
                   self.removeBlurScreen();
               }
           } else {
               // Fallback on earlier versions
           }
       }
       
       func blurScreen(style: UIBlurEffect.Style = UIBlurEffect.Style.regular) {
           screen = UIScreen.main.snapshotView(afterScreenUpdates: false)
           let blurEffect = UIBlurEffect(style: style)
           let blurBackground = UIVisualEffectView(effect: blurEffect)
           screen?.addSubview(blurBackground)
           blurBackground.frame = (screen?.frame)!
           window?.addSubview(screen!)
       }

       func removeBlurScreen() {
           screen?.removeFromSuperview()
       }

}

extension UIWindow {
 func secureApp() {
  let field = UITextField()
  field.isSecureTextEntry = true
  self.addSubview(field)
  field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
  self.layer.superlayer?.addSublayer(field.layer)
  field.layer.sublayers?.first?.addSublayer(self.layer)
}
}
