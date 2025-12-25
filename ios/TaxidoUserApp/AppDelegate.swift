import UIKit
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider
import Firebase
import GoogleMaps  // <-- Added for Google Maps

@main
class AppDelegate: RCTAppDelegate {
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    // Configure Firebase (for push notifications)
    FirebaseApp.configure()
    
    // Configure Google Maps API key
    GMSServices.provideAPIKey("AIzaSyAM_yzWXR0sgNHhxX2ZY6SChwGzBa0K3DM")  // <-- Replace with your real key, e.g. AIzaSyAM_yzWXR0sgNHhxX2ZY6SChwGzBa0K3DM
    
    // App name in React Native
    self.moduleName = "QaramurtTaxi"  // <-- Changed from TaxidoUserApp to your new name
    
    // Dependency provider
    self.dependencyProvider = RCTAppDependencyProvider()

    // Custom initial props (optional)
    self.initialProps = [:]
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Bundle URL for JS code
  override func sourceURL(for bridge: RCTBridge) -> URL? {
    self.bundleURL()
  }

  override func bundleURL() -> URL? {
#if DEBUG
    return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
#else
    return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
  }
}