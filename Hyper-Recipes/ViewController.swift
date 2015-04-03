import UIKit

class ViewController: UIViewController, UICollectionViewDelegate
{
    let DNHeaderViewHeight: CGFloat = 80.0
    let DNSeparationValueTitle: CGFloat = 15.0

    let DNTitleString = "SWIFTY RECIPES"
    let DNCellIdentifier = "CellID"

    var dataStack: DATAStack!
    var deviceWidth: CGFloat!
    var deviceHeight: CGFloat!
    var headerView: UIView!
    var titleLabel: UILabel!
    var tableView: UITableView!

    // MARK: Initializers

    required init(dataStack: DATAStack)
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

        tableView = UITableView(frame: CGRect(x: 0, y: DNHeaderViewHeight, width: deviceWidth, height: deviceHeight - DNHeaderViewHeight))

        view.addSubview(headerView)
    }

    var dataSource: DATASource!
    {
        get {
            if ((dataSource) != nil) {
                return self.dataSource
            }

            var request = NSFetchRequest(entityName:"Recipes")
            request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]

            return DATASource(tableView: self.tableView, fetchRequest: request, cellIdentifier: DNCellIdentifier, mainContext: dataStack.mainContext)
        }
    }
}

