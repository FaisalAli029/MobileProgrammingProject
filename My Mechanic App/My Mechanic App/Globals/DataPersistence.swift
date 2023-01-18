// This file manages everything related to the local storage data on the phone

import Foundation

let userInfoFileName: String = "userInfo"

var timeFormat: Int = 0 // Default: 24 Hour format
var currency: Int = 0 // Default: BHD



// [[ MANAGING APP'S SETTINGS ]]

// Get the time format
func getTimeFormatStr() -> String {
    var format: String = ""
    
    switch timeFormat {
    case 0:
        format = "HH:mm"
    case 1:
        format = "h:mm a"
    default:
        format = "HH:mm"
    }
    
    return format
}

// Get currency
func getCurrencyStr() -> String {
    var format: String = ""
    
    switch currency {
    case 0:
        format = "BHD"
    case 1:
        format = "USD"
    default:
        format = "BHD"
    }
    
    return format
}


// Get the currency



// [[ MANAGING USER'S CARS ]]

// Read the user's car data from local storage and returns it
func readCarsData() -> [Car] {
    
    var tempCarList: [Car] = []
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")
    
    let propertyListDecoder = PropertyListDecoder()
    
    if let retrievedData = try? Data(contentsOf: archiveURL),
       let decodedData = try? propertyListDecoder.decode(Array<Profile>.self, from: retrievedData) {
        
        //var counter: Int = 1
        //for data in decodedData {
        //    print("Car #\(counter)")
        //    print(data)
        //    print("")
        //
        //    counter += 1
        //}
        
        for data in decodedData[selectedProfileIndex].carsList {
            tempCarList.append(data)
        }
    }
    
    return tempCarList
}

// Adds a car to the global [My Cars] variable and then saves it to the local storage (for the user)
func addCarToLocalStorage(carData: Car) {
    profilesData[selectedProfileIndex].carsList.append(carData)
    myCarsData = profilesData[selectedProfileIndex].carsList
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")
    
    let propertyListEncoder = PropertyListEncoder()
    
    let encodedData = try? propertyListEncoder.encode(profilesData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}

// Overwrites the carsList both on local storage and the global variable
func updateCarsListStored(carsList: [Car]) {
    myCarsData = carsList
    profilesData[selectedProfileIndex].carsList = myCarsData
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")
    
    let propertyListEncoder = PropertyListEncoder()
    
    let encodedData = try? propertyListEncoder.encode(profilesData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}

// Updates a single Car
func updateCar(newCar: Car) {
    myCarsData[selectedCarIndex].manufacturer = newCar.manufacturer
    myCarsData[selectedCarIndex].model = newCar.model
    myCarsData[selectedCarIndex].yearManufactured = newCar.yearManufactured
    myCarsData[selectedCarIndex].engine = newCar.engine
    myCarsData[selectedCarIndex].licensePlate = newCar.licensePlate
    myCarsData[selectedCarIndex].mileage = newCar.mileage
    myCarsData[selectedCarIndex].cost = newCar.cost
    
    profilesData[selectedProfileIndex].carsList[selectedCarIndex] = myCarsData[selectedCarIndex]
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!

    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")

    let propertyListEncoder = PropertyListEncoder()

    let encodedData = try? propertyListEncoder.encode(profilesData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}



// [[ MANAGING USER'S SERVICES ]]

// Adds a service to the globally selected car (using an index) and then overwrites the carsList that is stored locally
func addServiceToLocalStorage(serviceData: Service) {
    myCarsData[selectedCarIndex].servicesList.append(serviceData)
    profilesData[selectedProfileIndex].carsList[selectedCarIndex].servicesList = myCarsData[selectedCarIndex].servicesList
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")
    
    let propertyListEncoder = PropertyListEncoder()
    
    let encodedData = try? propertyListEncoder.encode(profilesData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}

// Overwrites the servicesList of the selected car both on local storage and the global variable
func updateSerivcesListStored(servicesList: [Service]) {
    myCarsData[selectedCarIndex].servicesList = servicesList
    profilesData[selectedProfileIndex].carsList[selectedCarIndex].servicesList = servicesList
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")
    
    let propertyListEncoder = PropertyListEncoder()
    
    let encodedData = try? propertyListEncoder.encode(profilesData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}

// Updates a single service
func updateService(newService: Service) {
    myCarsData[selectedCarIndex].servicesList[selectedServiceIndex].title = newService.title
    myCarsData[selectedCarIndex].servicesList[selectedServiceIndex].date = newService.date
    myCarsData[selectedCarIndex].servicesList[selectedServiceIndex].serviceMileage = newService.serviceMileage
    myCarsData[selectedCarIndex].servicesList[selectedServiceIndex].serviceCost = newService.serviceCost
    myCarsData[selectedCarIndex].servicesList[selectedServiceIndex].isDone = newService.isDone
    
    profilesData[selectedProfileIndex].carsList[selectedCarIndex].servicesList = myCarsData[selectedCarIndex].servicesList
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!

    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")

    let propertyListEncoder = PropertyListEncoder()

    let encodedData = try? propertyListEncoder.encode(profilesData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}



// [[ MANAGING PROFILE INFO ]]

// Reads user's info and then returns it
func readUsersListStored() -> [Profile] {
    var tempProfilesList: [Profile] = []
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")
    
    let propertyListDecoder = PropertyListDecoder()
    
    if let retrievedUserInfo = try? Data(contentsOf: archiveURL),
       let decodedUserInfo = try? propertyListDecoder.decode(Array<Profile>.self, from: retrievedUserInfo) {
        for data in decodedUserInfo {
            tempProfilesList.append(data)
        }
    }
    
    return tempProfilesList
}

// Checks if a user already exists
func checkUserExistence(userInfo: Profile) -> Bool {
    let userExists: Bool = false
    let profilesStored: [Profile] = readUsersListStored()
    
    for profile in profilesStored {
        if userInfo.username == profile.username {
            return true
        }
    }
    
    return userExists
}

// Register a new user
func registerUserInfo(profileInfo: Profile) {
    profilesData.append(profileInfo)
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!

    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")

    let propertyListEncoder = PropertyListEncoder()

    let encodedData = try? propertyListEncoder.encode(profilesData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}

// Updates the current user's information
func updateUserProfile(updatedProfile: Profile) {
    profilesData[selectedProfileIndex].username = updatedProfile.username
    profilesData[selectedProfileIndex].fullName = updatedProfile.fullName
    profilesData[selectedProfileIndex].age = updatedProfile.age
    profilesData[selectedProfileIndex].address = updatedProfile.address
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!

    let archiveURL = documentsDirectory
        .appendingPathComponent(userInfoFileName)
        .appendingPathExtension("plist")

    let propertyListEncoder = PropertyListEncoder()

    let encodedData = try? propertyListEncoder.encode(profilesData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}
