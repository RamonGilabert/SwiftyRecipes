import UIKit

let DNBaseURL = "http://hyper-recipes.herokuapp.com/recipes"

class Networking: NSObject {

  var dataStack: DATAStack?

  required init(dataStack: DATAStack) {
    self.dataStack = dataStack
  }

  func fetchNewContent(completion: () -> Void) {
    let useURL = NSURL(string: DNBaseURL)
    let requestOperation = NSURLRequest(URL: useURL!)
    NSURLConnection.sendAsynchronousRequest(requestOperation, queue: NSOperationQueue()) { (_, data, error) -> Void in
      if error != nil {
        let alertController = UIAlertController(title: "Oooops!", message: "There was an error fetching your data.", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { action in
          alertController.dismissViewControllerAnimated(true, completion: nil)
        })
        alertController.addAction(alertAction)
      } else {
        let JSONSerialization: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
        println(JSONSerialization)
        Sync.changes(JSONSerialization as NSArray, inEntityNamed: "Recipes", dataStack: self.dataStack, completion: { [unowned self] error in
          completion()
        })
      }
    }
  }
}
