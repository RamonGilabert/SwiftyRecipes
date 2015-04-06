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
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(DNCellIdentifier, forIndexPath: indexPath) as RecipesCollectionViewCell

    cell.configureCell(self.arrayWithObjects[indexPath.row])
    
    return cell
  }

  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let cell = self.collectionView!.cellForItemAtIndexPath(indexPath) as RecipesCollectionViewCell
    let detailViewController = DetailViewController(recipe: self.arrayWithObjects[indexPath.row])

    var imageView = UIImageView()

    for view in cell.subviews {
      if view.isKindOfClass(UIImageView().classForCoder) {
        imageView = view as UIImageView
        imageView.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y + DNHeaderViewHeight, view.frame.width, view.frame.height)
        self.view.addSubview(imageView)
      }
    }

    UIView.animateWithDuration(0.7, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
      imageView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 200)

    }, completion: { finished in
      self.presentViewController(detailViewController, animated: true, completion: nil)
    })
  }

  // MARK: Fetching methods

  func fetchCurrentPosts() {
    let request = NSFetchRequest(entityName: "Recipes")
    request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
    self.arrayWithObjects = self.dataStack!.mainContext.executeFetchRequest(request, error: nil) as Array
  }
}

