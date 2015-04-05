import UIKit

let DNHeaderViewHeight: CGFloat = 80.0
let DNSeparationValueTitle: CGFloat = 15.0

let DNTitleString = "SWIFTY RECIPES"
let DNCellIdentifier = "CellID"

class ViewController: UICollectionViewController {
  
  var dataStack: DATAStack!
  var deviceWidth: CGFloat!
  var deviceHeight: CGFloat!

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

    self.title = DNTitleString
  }

  // MARK: Helper methods

  func layoutCollectionView() {
    let collectionViewLayout = UICollectionViewFlowLayout()
    collectionViewLayout.itemSize = CGSizeMake(50, 50)
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Vertical

    self.collectionView = UICollectionView(frame: CGRectMake(0, 0, 20, 20), collectionViewLayout: collectionViewLayout)
    self.collectionView!.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: DNCellIdentifier)
  }
}

