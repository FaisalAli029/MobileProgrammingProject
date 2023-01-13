import Foundation

struct Profile: Codable {
    var email: String
    var password: String
    var fullName: String
    var age: String
    var address: String
    var carsList: [Car]
}
