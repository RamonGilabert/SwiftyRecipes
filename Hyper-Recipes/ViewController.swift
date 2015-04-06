import UIKit

let DNHeaderViewHeight: CGFloat = 80.0
let DNSeparationValueTitle: CGFloat = 15.0

let DNTitleString = "SWIFTY RECIPES"
let DNCellIdentifier = "CellID"

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  var dataStack: DATAStack?
  var collectionView: UICollectionView?
  var arrayWithObjects = [Recipes]()
  let layoutManager = LayoutViews()
  let networkManager = Networking()

  // MARK: Initializers

  required init(dataStack: DATAStack) {
    super.init(nibName: nil, bundle: nil);

    self.networkManager.fetchNewContent(dataStack, completion: { () -> Void in
      self.fetchCurrentPosts()
      self.collectionView!.reloadData()
    })

    self.dataStack = dataStack
  }

  required init(coder aDecoder: NSCoder) {
    super.init(nibName: nil, bundle: nil);
  }

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    let headerView = self.layoutManager.layoutHeader()
    self.view.addSubview(headerView)

    self.collectionView = self.layoutManager.layoutCollectionView(self, dataSource: self)
    self.view.addSubview(self.collectionView!)

    fetchCurrentPosts()
    self.collectionView!.reloadData()
  }

  // MARK: UICollectionView methods

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.arrayWithObjects.count
  }

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    var cell = collectionView.dequeueReusableCellWithReuseIdentifier(DNCellIdentifier, forIndexPath: indexPath) as RecipesCollectionViewCell

    let recipe = self.arrayWithObjects[indexPath.row]
    cell.configureCell(recipe.name)
    
    return cell
  }

  // MARK: Fetching methods

  func fetchCurrentPosts() {
    let request = NSFetchRequest(entityName: "Recipes")
    request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
    self.arrayWithObjects = self.dataStack!.mainContext.executeFetchRequest(request, error: nil) as Array
  }
}

