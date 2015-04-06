import UIKit

class DetailViewController: UIViewController {

  let layoutManager = LayoutViews()
  var recipe: Recipes?

  init(recipe: Recipes) {
    super.init(nibName: nil, bundle: nil)
    self.recipe = recipe
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let headerView = self.layoutManager.layoutHeader()
    self.view.addSubview(headerView)
  }

}
