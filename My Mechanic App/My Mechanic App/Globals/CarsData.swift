import Foundation

let dateFormatter = DateFormatter()

var carsData: [Car] = [
    
    Car(
        manufacturer: "Toyota",
        model: "Corolla",
        yearManufactured: 1966,
        engine: "V6",
        licensePlate: "123456",
        mileage: 17263.315,
        cost: 6000.00,
        servicesList: [
            Service(
                title: "Oil Change",
                date: Date(),
                serviceMileage: 12000,
                serviceCost: 50
            ),
            Service(
                title: "Filter Change",
                date: Date(),
                serviceMileage: 12500,
                serviceCost: 5
            ),
            Service(
                title: "Tire Change",
                date: Date(),
                serviceMileage: 100000,
                serviceCost: 12
            ),
        ]
    ),
    
    Car(
        manufacturer: "Koenigsegg",
        model: "Jesko",
        yearManufactured: 2022,
        engine: "5.0 litre twin-turbo V8",
        licensePlate: "001122",
        mileage: 0.0,
        cost: 123456789.00,
        servicesList: [
            Service(
                title: "Oil Change",
                date: Date.now,
                serviceMileage: 12000,
                serviceCost: 50
            ),
            Service(
                title: "Filter Change",
                date: Date.now,
                serviceMileage: 12500,
                serviceCost: 5
            ),
            Service(
                title: "Tire Change",
                date: Date.now,
                serviceMileage: 100000,
                serviceCost: 12
            ),
        ]
    ),
    
    Car(
        manufacturer: "Dodge",
        model: "Charger",
        yearManufactured: 1966,
        engine: "5.7L HEMI® V8",
        licensePlate: "619916",
        mileage: 0.0,
        cost: 12345.00,
        servicesList: [
            Service(
                title: "Oil Change",
                date: Date.now,
                serviceMileage: 12000,
                serviceCost: 50
            ),
            Service(
                title: "Filter Change",
                date: Date.now,
                serviceMileage: 12500,
                serviceCost: 5
            ),
            Service(
                title: "Tire Change",
                date: Date.now,
                serviceMileage: 100000,
                serviceCost: 12
            ),
        ]
    ),
]
