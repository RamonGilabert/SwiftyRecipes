import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  let DNHeaderViewHeight: CGFloat = 80.0
  let DNCellIdentifier = "CellID"

  var window: UIWindow?
  lazy var dataStack: DATAStack = DATAStack(modelName: "Hyper_Recipes")

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)

    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

    let initialViewController = ViewController(dataStack: self.dataStack)

    self.window!.rootViewController = initialViewController
    self.window!.makeKeyAndVisible()

    return true
  }

  func applicationWillTerminate(application: UIApplication) {
    self.dataStack.persistWithCompletion(nil)
  }
}

