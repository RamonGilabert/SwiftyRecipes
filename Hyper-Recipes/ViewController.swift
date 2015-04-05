import UIKit

let DNHeaderViewHeight: CGFloat = 80.0
let DNSeparationValueTitle: CGFloat = 15.0

let DNTitleString = "SWIFTY RECIPES"
let DNCellIdentifier = "CellID"

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  var dataStack: DATAStack!
  var deviceWidth: CGFloat!
  var deviceHeight: CGFloat!
  var collectionView: UICollectionView!
  let layoutManager = LayoutViews()

  // MARK: Initializers

  required init(dataStack: DATAStack) {
    super.init(nibName: nil, bundle: nil);
    self.dataStack = dataStack
  }

  required init(coder aDecoder: NSCoder) {
    super.init(nibName: nil, bundle: nil);
  }

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.deviceWidth = UIScreen.mainScreen().bounds.size.width
    self.deviceHeight = UIScreen.mainScreen().bounds.size.height

    let headerView = self.layoutManager.layoutHeader()
    self.view.addSubview(headerView)

    layoutCollectionView()
  }

  // MARK: UICollectionView methods

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    var cell = collectionView.dequeueReusableCellWithReuseIdentifier(DNCellIdentifier, forIndexPath: indexPath) as UICollectionViewCell
    cell.backgroundColor = UIColor.blackColor()
    return cell
  }

  // MARK: Helper methods

  func layoutCollectionView() {
    let collectionViewLayout = UICollectionViewFlowLayout()
    collectionViewLayout.itemSize = CGSizeMake(self.deviceWidth/2 - 5, self.deviceWidth/2 - 5)
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Vertical

    self.collectionView = UICollectionView(frame: CGRectMake(0, DNHeaderViewHeight, self.deviceWidth, self.deviceHeight - DNHeaderViewHeight), collectionViewLayout: collectionViewLayout)
    self.collectionView!.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: DNCellIdentifier)

    self.collectionView.backgroundColor = UIColor.whiteColor()
    self.collectionView.delegate = self
    self.collectionView.dataSource = self

    self.view.addSubview(self.collectionView)
  }
}

