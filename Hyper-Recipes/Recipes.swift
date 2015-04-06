import Foundation
import CoreData

@objc(Recipes)

class Recipes: NSManagedObject {

  @NSManaged var createdAt: NSDate
  @NSManaged var name: String
  @NSManaged var remoteID: String
  @NSManaged var updatedAt: NSDate
  @NSManaged var photo: Photos

}
