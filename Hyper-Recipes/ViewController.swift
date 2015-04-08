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
  var imageView: UIImageView!
  var cellSelected: UIImageView!
  var frameToGo: CGRect?

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

    self.view.backgroundColor = UIColor.whiteColor()

    self.layoutManager.layoutHeader(self.view)
    self.collectionView = self.layoutManager.layoutCollectionView(self, dataSource: self, view: self.view)

    fetchCurrentPosts()
    self.collectionView!.reloadData()
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    if self.imageView != nil {
      self.view!.addSubview(self.imageView)
      Animations.springAnimationNormalDuration({ () -> Void in
        self.imageView.frame = self.frameToGo!
        self.collectionView!.alpha = 1.0
      }, completion: { finished in
        self.cellSelected.alpha = 1.0
        self.imageView.removeFromSuperview()
      })
    }
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
    self.imageView = getImageViewFromCell(cell)

    Animations.springAnimationNormalDuration({ () -> Void in
      self.imageView.frame = CGRectMake(0, DNHeaderViewHeight, UIScreen.mainScreen().bounds.width, 250)
      self.collectionView!.alpha = 0.0
    }, completion: { finished in
      detailViewController.imageView = self.imageView
      cell.alpha = 1.0
      self.presentViewController(detailViewController, animated: false, completion: nil)
    })
  }

  // MARK: Helper methods

  func getImageViewFromCell(cell: RecipesCollectionViewCell) -> UIImageView {
    var imageView = UIImageView()

    for view in cell.subviews {
      if view.isKindOfClass(UIImageView().classForCoder) {
        var imageViewCell = view as UIImageView
        cellSelected = imageViewCell
        imageView.image = imageViewCell.image
        cell.alpha = 0.0
        self.cellSelected.alpha = 0.0
        var rectInSuperView = self.collectionView!.convertRect(cell.frame, toView: self.collectionView!.superview)
        imageView.frame = CGRectMake(rectInSuperView.origin.x, rectInSuperView.origin.y, view.frame.width, view.frame.height)
        self.frameToGo = imageView.frame
        self.view.addSubview(imageView)
      }
    }

    return imageView
  }

  // MARK: Fetching methods

  func fetchCurrentPosts() {
    let request = NSFetchRequest(entityName: "Recipes")
    request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
    self.arrayWithObjects = self.dataStack!.mainContext.executeFetchRequest(request, error: nil) as Array
  }
}
