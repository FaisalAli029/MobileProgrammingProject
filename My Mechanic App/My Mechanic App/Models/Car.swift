import Foundation

struct Car {
//    private let dateFormatter = DateFormatter()
    
    let ID = UUID()
    var manufacturer: String
    var model: String
    var yearManufactured: Int
    var engine: String
    var licensePlate: String
    var mileage: Double
    var cost: Double
    var servicesList: [Service]
    
//    func getYearManufaturedAsString() -> String {
//        return dateFormatter.string(from: self.yearManufactured)
//    }
}
