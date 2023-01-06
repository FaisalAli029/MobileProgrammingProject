import Foundation

let dateFormatter = DateFormatter()

let carsData: [Car] = [
    Car(
        manufacturer: "Toyota",
        model: "Corolla",
        yearManufactured: dateFormatter.date(from: "1966-11-05") ?? Date.now, // uses the custom date, otherise if null, it will use current date.
        engine: "V6",
        licensePlate: "123456",
        mileage: 17263.315,
        cost: 6000.00,
        servicesList: []
    ),
    Car(
        manufacturer: "Koenigsegg",
        model: "Jesko",
        yearManufactured: dateFormatter.date(from: "2023-05-15") ?? Date.now, // uses the custom date, otherise if null, it will use current date.
        engine: "5.0 litre twin-turbo V8",
        licensePlate: "001122",
        mileage: 0.0,
        cost: 123456789.00,
        servicesList: []
    ),
    Car(
        manufacturer: "Dodge",
        model: "Charger",
        yearManufactured: dateFormatter.date(from: "1966-07-21") ?? Date.now, // uses the custom date, otherise if null, it will use current date.
        engine: "5.7L HEMI® V8",
        licensePlate: "619916",
        mileage: 0.0,
        cost: 12345.00,
        servicesList: []
    ),
]
