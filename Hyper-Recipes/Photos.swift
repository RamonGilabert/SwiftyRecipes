import Foundation
import CoreData

@objc(Photos)

class Photos: NSManagedObject {

  @NSManaged var url: String?
  @NSManaged var recipe: Recipes

}
