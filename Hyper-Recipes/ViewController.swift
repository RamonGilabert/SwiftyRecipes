import UIKit

class ViewController: UIViewController
{
    let DNHeaderViewHeight: CGFloat = 80.0
    let DNSeparationValueTitle: CGFloat = 15.0
    let DNTitleString = "SWIFTY RECIPES"

    var dataStack: DATAStack!
    var deviceWidth: CGFloat!
    var deviceHeight: CGFloat!
    var headerView: UIView!
    var titleLabel: UILabel!

    // MARK: Initializers

    init(dataStack: DATAStack)
    {
        super.init(nibName: nil, bundle: nil);
        self.dataStack = dataStack
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View timecycle

    override func viewDidLoad()
    {
        super.viewDidLoad()

        deviceWidth = UIScreen.mainScreen().bounds.size.width
        deviceHeight = UIScreen.mainScreen().bounds.size.height

        headerView = UIView(frame: CGRect(x: 0, y: 0, width: deviceWidth, height: DNHeaderViewHeight))
        headerView.backgroundColor = UIColor(red:0.87, green:0.36, blue:0.5, alpha:1)

        titleLabel = UILabel(frame: CGRect(x: 0, y: DNSeparationValueTitle, width: deviceWidth, height: DNHeaderViewHeight-DNSeparationValueTitle))
        titleLabel.text = DNTitleString
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont_Recipes.headerFont()
        titleLabel.textAlignment = NSTextAlignment.Center
        headerView.addSubview(titleLabel)

        view.addSubview(headerView)
    }
}

