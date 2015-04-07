import UIKit

class DetailViewController: UIViewController {

  let layoutManager = LayoutViews()
  var recipe: Recipes?
  var imageView: UIImageView?

  init(recipe: Recipes) {
    super.init(nibName: nil, bundle: nil)
    self.recipe = recipe
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = UIColor.whiteColor()

    let headerView = self.layoutManager.layoutHeader()
    self.view.addSubview(headerView)
    self.view.addSubview(self.imageView!)

    let labelTitle = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - 40, 0))
    labelTitle.font = UIFont_Recipes.headerFontRecipes()
    labelTitle.text = self.recipe!.name
    labelTitle.sizeToFit()
    labelTitle.frame = CGRectMake(20, self.imageView!.frame.height + 20 + headerView.frame.height, labelTitle.frame.width, labelTitle.frame.height)
    self.view.addSubview(labelTitle)

    let descriptionRecipe = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - 40, 100))
    descriptionRecipe.font = UIFont_Recipes.descriptionRecipes()

    if self.recipe!.descriptionID != nil {
      descriptionRecipe.text = self.recipe!.description
    } else {
      descriptionRecipe.text = "There is no description here, but you know, this recipe is as awesome as the others! Put a little bit of flavour, a little bit of love, and you got it!"
    }

    descriptionRecipe.numberOfLines = 10
    descriptionRecipe.sizeToFit()
    descriptionRecipe.frame = CGRectMake(20, labelTitle.frame.origin.y + labelTitle.frame.height + 7.5, descriptionRecipe.frame.width, descriptionRecipe.frame.height)
    self.view.addSubview(descriptionRecipe)

    let buttonGoBack = UIButton(frame: CGRectMake(7.5, (headerView.frame.height - 30)/2 + 7.5, 30, 30))
    buttonGoBack.setImage(UIImage(named: "back"), forState: UIControlState.Normal)
    buttonGoBack.addTarget(self, action: "onBackButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(buttonGoBack)
    
  }

  func onBackButtonPressed(sender: UIButton!) {
    self.dismissViewControllerAnimated(false, completion: nil)
  }

}
