import Foundation

struct Car {
    let ID = UUID()
    var manufacturer: String
    var model: String
    var yearManufactured: Int
    var engine: String
    var licensePlate: String
    var mileage: Double
    var cost: Double
    var servicesList: [Service]
}
