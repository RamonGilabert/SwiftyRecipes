import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var initialViewController: UIViewController?
    var dataStack: DATAStack!
        {
            get {
                return DATAStack(modelName: "Hyper_Recipes")
            }
        }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        initialViewController = ViewController(dataStack: self.dataStack)

        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillTerminate(application: UIApplication)
    {
        self.dataStack.persistWithCompletion(nil)
    }
}

