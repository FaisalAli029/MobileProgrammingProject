import Foundation

struct Service: Codable {
    var id = UUID()
    var title: String
    var date: Date
    var serviceMileage: Double
    var serviceCost: Double
    var isDone: Bool
}
