import UIKit

let DNDenominatorBottomView: CGFloat = 1.5
let DNTwoMultiplier: CGFloat = 2.0
let DNAlphaBottomView: CGFloat = 0.5
let DNSeparationLabel: CGFloat = 7.5

class RecipesCollectionViewCell: UICollectionViewCell {

  func configureCell(recipe: Recipes) {

    removeSubviews()

    let bottomView = UIView(frame: CGRectMake(0, self.frame.size.width/DNDenominatorBottomView, self.frame.size.width, self.frame.size.width - self.frame.size.width/DNDenominatorBottomView))
    let bottomLabel = UILabel(frame: CGRectMake(DNSeparationLabel, 0, bottomView.frame.size.width - DNSeparationLabel*DNTwoMultiplier, 0))
    let difficultyLabel = UILabel(frame: CGRectMake(DNSeparationLabel, 0, bottomView.frame.size.width - DNSeparationLabel*DNTwoMultiplier, 0))
    let imageView = UIImageView(frame: CGRectMake(0, 0, self.frame.width, self.frame.height - bottomView.frame.height))

    bottomLabel.font = UIFont_Recipes.titleFont()
    bottomLabel.textColor = UIColor.whiteColor()
    bottomLabel.text = recipe.name
    bottomLabel.sizeToFit()
    bottomLabel.frame = CGRectMake(DNSeparationLabel, bottomView.frame.origin.y + DNSeparationLabel, bottomLabel.frame.width, bottomLabel.frame.height)

    difficultyLabel.font = UIFont_Recipes.difficultyFont()
    difficultyLabel.textColor = UIColor.whiteColor()
    difficultyLabel.text = "Difficulty: \(recipe.difficulty)"
    difficultyLabel.sizeToFit()
    difficultyLabel.frame = CGRectMake(DNSeparationLabel, self.frame.height - DNSeparationLabel - difficultyLabel.frame.height, difficultyLabel.frame.width, difficultyLabel.frame.height)

    if recipe.difficulty.integerValue == 1 {
      bottomView.backgroundColor = UIColor(red:0.6, green:0.79, blue:0.33, alpha:1)
    } else if recipe.difficulty.integerValue == 2 {
      bottomView.backgroundColor = UIColor(red:0.96, green:0.43, blue:0.27, alpha:1)
    } else {
      bottomView.backgroundColor = UIColor(red:0.93, green:0.38, blue:0.46, alpha:1)
    }

    if recipe.photo.url != nil {
      let urlPhoto = NSURL(string: recipe.photo.url!)
      let urlRequest = NSURLRequest(URL: urlPhoto!)
      imageView.image = UIImage(named: "placeholderLoading")
      NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue()) { (_, data, error) -> Void in
        imageView.image = UIImage(data: data)
      }
    } else {
      imageView.image = UIImage(named: "placeholder")
    }

    self.addSubview(bottomView)
    self.addSubview(bottomLabel)
    self.addSubview(difficultyLabel)
    self.addSubview(imageView)
  }

  func removeSubviews() {
    for view in self.subviews {
      view.removeFromSuperview()
    }
  }
}
