import UIKit

let DNAnimationDurationBack = 0.5 as NSTimeInterval

class DetailViewController: UIViewController {

  let layoutManager = LayoutViews()
  var recipe: Recipes?
  var imageView: UIImageView?
  var labelTitle: UILabel!
  var descriptionRecipe: UILabel!

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

    self.layoutManager.layoutHeader(self.view)

    self.view.addSubview(self.imageView!)

    self.labelTitle = self.layoutManager.layoutLabelInYPosition(self.imageView!.frame.height + 20 + DNHeaderViewHeight, text: self.recipe!.name, font: UIFont_Recipes.headerFontRecipes(), view: self.view)
    self.descriptionRecipe = self.layoutManager.layoutLabelInYPosition(self.labelTitle.frame.origin.y + self.labelTitle.frame.height + 7.5, text: getDescriptionRecipe(), font: UIFont_Recipes.descriptionRecipes(), view: self.view)

    let buttonGoBack = UIButton(frame: CGRectMake(7.5, (DNHeaderViewHeight - 30)/2 + 7.5, 30, 30))
    buttonGoBack.setImage(UIImage(named: "back"), forState: UIControlState.Normal)
    buttonGoBack.addTarget(self, action: "onBackButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(buttonGoBack)
    
  }

  func onBackButtonPressed(sender: UIButton!) {
    Animations.springAnimationWithDuration(DNAnimationDurationBack, animations: { () -> Void in
      self.labelTitle.alpha = 0.0
      self.descriptionRecipe.alpha = 0.0
    }, completion: { finished in
      self.dismissViewControllerAnimated(false, completion: nil)
    })
  }

  // MARK: Helper methods

  func getDescriptionRecipe() -> String {
    if self.recipe!.descriptionID != nil {
      return self.recipe!.description
    } else {
      return "There is no description here, but you know, this recipe is as awesome as the others! Put a little bit of flavour, a little bit of love, and you got it!"
    }
  }
}
