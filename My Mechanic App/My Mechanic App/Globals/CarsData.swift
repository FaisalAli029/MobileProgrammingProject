import Foundation

// Use [dateFormatter.dateFormat = "yyyy-MM-dd"] to get date in a customized string format
var dateFormatter = DateFormatter()

func convertCurrency(value: Double, to: String) -> Double {
    var result: Double = 0
    
    switch to {
    case "BHD":
        //result = value * 0.3777
        result = value
    case "USD":
        result = value * 2.6524
    default:
        result = value
    }
    
    return result
}

func convertToBHD(value: Double) -> Double {
    return value * 0.3777
}

var profilesData: [Profile] = readUsersListStored()
var selectedProfileIndex: Int = 0

var myCarsData: [Car] = []
var selectedCarIndex: Int = 0
var selectedServiceIndex: Int = 0
