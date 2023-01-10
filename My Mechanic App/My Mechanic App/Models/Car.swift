import Foundation

struct Car: Codable {
    var ID = UUID()
    var manufacturer: String
    var model: String
    var yearManufactured: Int
    var engine: String
    var licensePlate: String
    var mileage: Double
    var cost: Double
    var servicesList: [Service]
}
