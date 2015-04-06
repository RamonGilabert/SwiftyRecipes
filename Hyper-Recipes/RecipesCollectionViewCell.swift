import UIKit

let DNDenominatorBottomView: CGFloat = 1.5
let DNTwoMultiplier: CGFloat = 2.0
let DNAlphaBottomView: CGFloat = 0.5
let DNSeparationLabel: CGFloat = 7.5

class RecipesCollectionViewCell: UICollectionViewCell {

  func configureCell(recipe: Recipes) {

    removeSubviews()

    let bottomView = UIView(frame: CGRectMake(0, self.frame.size.width/DNDenominatorBottomView, self.frame.size.width, self.frame.size.width - self.frame.size.width/DNDenominatorBottomView))
    let bottomLabel = UILabel(frame: CGRectMake(DNSeparationLabel, bottomView.frame.origin.y, bottomView.frame.size.width - DNSeparationLabel*DNTwoMultiplier, bottomView.frame.size.height))
    let difficultyLabel = UILabel(frame: CGRectMake(0, 0, 0, 0))

    bottomView.backgroundColor = UIColor.blackColor()
    bottomView.alpha = DNAlphaBottomView

    bottomLabel.font = UIFont_Recipes.titleFont()
    bottomLabel.textColor = UIColor.whiteColor()
    bottomLabel.text = recipe.name
    bottomLabel.sizeToFit()
    bottomLabel.frame = CGRectMake(DNSeparationLabel, bottomView.frame.origin.y + DNSeparationLabel, bottomLabel.frame.width, bottomLabel.frame.height)

    difficultyLabel.font = UIFont_Recipes.difficultyFont()
    difficultyLabel.textColor = UIColor.whiteColor()
    difficultyLabel.text = "Difficulty: /()"

    self.addSubview(bottomView)
    self.addSubview(bottomLabel)
    self.addSubview(difficultyLabel)
  }

  func removeSubviews() {
    for view in self.subviews {
      view.removeFromSuperview()
    }
  }
}
