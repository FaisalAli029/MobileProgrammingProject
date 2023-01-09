import Foundation

import CoreData

@objc(Service)
class Service: NSManagedObject
{ //creating NSManaged variables for the entity attributes which acts like container objects(storage)
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var date: String!
    @NSManaged var mileage: String!
    @NSManaged var totalCost: String!
    @NSManaged var deletedService: Date?
    
}
