import UIKit

class ViewController: UIViewController
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

    // MARK: View lifecycle

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.deviceWidth = UIScreen.mainScreen().bounds.size.width
        self.deviceHeight = UIScreen.mainScreen().bounds.size.height

        layoutHeaderView()
    }

    var dataSource: DATASource!
    {
        get {
            if ((dataSource) != nil) {
                return self.dataSource
            }

            var request = NSFetchRequest(entityName:"Recipes")
            request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]

            return DATASource(tableView: self.tableView, fetchRequest: request, cellIdentifier: DNCellIdentifier, mainContext: self.dataStack.mainContext)
        }
    }

    // MARK: Layout view

    func layoutHeaderView()
    {
        self.headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.deviceWidth, height: DNHeaderViewHeight))
        self.headerView.backgroundColor = UIColor(red:0.87, green:0.36, blue:0.5, alpha:1)

        self.titleLabel = UILabel(frame: CGRect(x: 0, y: DNSeparationValueTitle, width: self.deviceWidth, height: DNHeaderViewHeight-DNSeparationValueTitle))
        self.titleLabel.text = DNTitleString
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.font = UIFont_Recipes.headerFont()
        self.titleLabel.textAlignment = NSTextAlignment.Center

        self.headerView.addSubview(self.titleLabel)
        self.view.addSubview(self.headerView)

        self.tableView = UITableView(frame: CGRect(x: 0, y: DNHeaderViewHeight, width: self.deviceWidth, height: self.deviceHeight - DNHeaderViewHeight))
        self.view.addSubview(tableView)
    }
}

