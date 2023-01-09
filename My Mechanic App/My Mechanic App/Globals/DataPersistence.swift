// This file manages everything related to the local storage data on the phone

import Foundation

// Read data from local storage and returns it
func readCarsData() -> [Car] {
    
    var tempCarList: [Car] = []
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent("carsData")
        .appendingPathExtension("plist")
    
    let propertyListDecoder = PropertyListDecoder()
    
    if let retrievedData = try? Data(contentsOf: archiveURL),
       let decodedData = try? propertyListDecoder.decode(Array<Car>.self, from: retrievedData) {
        
        //var counter: Int = 1
        //for data in decodedData {
        //    print("Car #\(counter)")
        //    print(data)
        //    print("")
        //
        //    counter += 1
        //}
        
        for data in decodedData {
            tempCarList.append(data)
        }
    }
    
    return tempCarList
}

// Adds a car to the global [My Cars] variable and then saves it to the local storage
func addCarToLocalStorage(carData: Car) {
    myCarsData.append(carData)
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent("carsData")
        .appendingPathExtension("plist")
    
    let propertyListEncoder = PropertyListEncoder()
    
    let encodedData = try? propertyListEncoder.encode(myCarsData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}

// Overwrites the carsList both on local storage and the global variable
func updateCarsListStored(carsList: [Car]) {
    myCarsData = carsList
    
    let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    ).first!
    
    let archiveURL = documentsDirectory
        .appendingPathComponent("carsData")
        .appendingPathExtension("plist")
    
    let propertyListEncoder = PropertyListEncoder()
    
    let encodedData = try? propertyListEncoder.encode(myCarsData)
    try? encodedData?.write(to: archiveURL, options: .noFileProtection)
}
