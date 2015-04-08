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

    self.labelTitle = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - 40, 0))
    self.labelTitle.font = UIFont_Recipes.headerFontRecipes()
    self.labelTitle.text = self.recipe!.name
    self.labelTitle.sizeToFit()
    self.labelTitle.frame = CGRectMake(20, self.imageView!.frame.height + 20 + DNHeaderViewHeight, labelTitle.frame.width, labelTitle.frame.height)
    self.view.addSubview(self.labelTitle)

    self.descriptionRecipe = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - 40, 100))
    self.descriptionRecipe.font = UIFont_Recipes.descriptionRecipes()

    if self.recipe!.descriptionID != nil {
      self.descriptionRecipe.text = self.recipe!.description
    } else {
      self.descriptionRecipe.text = "There is no description here, but you know, this recipe is as awesome as the others! Put a little bit of flavour, a little bit of love, and you got it!"
    }

    self.descriptionRecipe.numberOfLines = 10
    self.descriptionRecipe.sizeToFit()
    self.descriptionRecipe.frame = CGRectMake(20, labelTitle.frame.origin.y + labelTitle.frame.height + 7.5, descriptionRecipe.frame.width, descriptionRecipe.frame.height)
    self.view.addSubview(self.descriptionRecipe)

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
}
