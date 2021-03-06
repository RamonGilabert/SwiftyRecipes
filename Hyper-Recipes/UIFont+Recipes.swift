import UIKit

class UIFont_Recipes: UIFont
{
  class func headerFont() -> UIFont! {
      return UIFont(name: "AvenirNext-DemiBold", size: 22)
  }

  class func headerFontRecipes() -> UIFont! {
    return UIFont(name: "AvenirNext-DemiBold", size: 26)
  }

  class func descriptionRecipes() -> UIFont! {
    return UIFont(name: "AvenirNext-Medium", size: 18)
  }

  class func titleFont() -> UIFont! {
    return UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
  }

  class func difficultyFont() -> UIFont! {
    return UIFont(name: "AvenirNextCondensed-Medium", size: 14)
  }
}
