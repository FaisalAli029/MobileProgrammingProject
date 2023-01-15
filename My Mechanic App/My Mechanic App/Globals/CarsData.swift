import Foundation

// Use [dateFormatter.dateFormat = "yyyy-MM-dd"] to get date in a customized string format
var dateFormatter = DateFormatter()

var profilesData: [Profile] = readUsersListStored()
var selectedProfileIndex: Int = 0

var myCarsData: [Car] = []
var selectedCarIndex: Int = 0
var selectedServiceIndex: Int = 0
