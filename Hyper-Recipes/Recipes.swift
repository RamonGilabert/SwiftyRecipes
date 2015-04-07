import Foundation
import CoreData

@objc(Recipes)

class Recipes: NSManagedObject {

  @NSManaged var createdAt: NSDate
  @NSManaged var descriptionID: String
  @NSManaged var name: String
  @NSManaged var remoteID: String
  @NSManaged var updatedAt: NSDate
  @NSManaged var difficulty: NSNumber
  @NSManaged var photo: Photos

}
