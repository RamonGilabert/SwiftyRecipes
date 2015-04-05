import UIKit

class LayoutViews: NSObject {

  func layoutHeader() -> UIView {
    let headerView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, DNHeaderViewHeight))
    let titleLabel = UILabel(frame: CGRectMake(0, DNSeparationValueTitle, UIScreen.mainScreen().bounds.size.width, DNHeaderViewHeight - DNSeparationValueTitle))

    headerView.backgroundColor = UIColor(red:0.83, green:0.43, blue:0.36, alpha:1)
    titleLabel.text = DNTitleString
    titleLabel.font = UIFont_Recipes.headerFont()
    titleLabel.textAlignment = NSTextAlignment.Center
    titleLabel.textColor = UIColor.whiteColor()

    headerView.addSubview(titleLabel)

    return headerView
  }
   
}
