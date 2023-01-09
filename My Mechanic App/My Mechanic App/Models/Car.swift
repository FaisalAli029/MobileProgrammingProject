import Foundation
import CoreData

@objc(Car)
class Car: NSManagedObject
{ //creating NSManaged variables for the entity attributes which acts like container objects(storage)
    @NSManaged var carID: NSNumber!
    @NSManaged var cost: String!
    @NSManaged var engine: String!
    @NSManaged var manufacturer: String!
    @NSManaged var mileage: String!
    @NSManaged var yearManufactured: String!
    @NSManaged var licensePlate: String!
    @NSManaged var model: String!
    @NSManaged var deletedCar: Date?

   
}

