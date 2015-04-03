import UIKit

class ViewController: UIViewController
{
    let headerViewHeight: CGFloat = 80.0

    var dataStack: DATAStack!
    var deviceWidth: CGFloat!
    var deviceHeight: CGFloat!
    var headerView: UIView!

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

        headerView = UIView(frame: CGRect(x: 0, y: 0, width: deviceWidth, height: headerViewHeight))
        headerView.backgroundColor = UIColor.whiteColor()

        view.addSubview(headerView)
    }
}

