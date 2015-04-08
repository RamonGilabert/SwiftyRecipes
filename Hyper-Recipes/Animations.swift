import UIKit

class Animations: NSObject {

  class func springAnimationWithDuration(duration: NSTimeInterval, animations: (() -> Void)!, completion: ((Bool) -> Void)!) {
    UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
      animations()
    }, completion: { finished in
      completion(true)
    })
  }

  class func springAnimationNormalDuration(animations: (() -> Void)!, completion: ((Bool) -> Void)!) {
    UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
      animations()
    }, completion: { finished in
      completion(true)
    })
  }
}
