import Foundation

 let dateFormatter = DateFormatter()

var carsData: [Cars] = [
    
    Cars(
        manufacturer: "Toyota",
        model: "Corolla",
        yearManufactured: 1966,
        engine: "V6",
        licensePlate: "123456",
        mileage: 17263.315,
        cost: 6000.00,
        servicesList: [
            Services(
                titles: "Oil Change",
                dates: Date(),
                serviceMileages: 12000,
                serviceCosts: 50
            ),
            Services(
                titles: "Filter Change",
                dates: Date(),
                serviceMileages: 12500,
                serviceCosts: 5
            ),
            Services(
                titles: "Tire Change",
                dates: Date(),
                serviceMileages: 100000,
                serviceCosts: 12
            ),
        ]
    ),
    
    Cars(
        manufacturer: "Koenigsegg",
        model: "Jesko",
        yearManufactured: 2022,
        engine: "5.0 litre twin-turbo V8",
        licensePlate: "001122",
        mileage: 0.0,
        cost: 123456789.00,
        servicesList: [
            Services(
                titles: "Oil Change",
                dates: Date.now,
                serviceMileages: 12000,
                serviceCosts: 50
            ),
            Services(
                titles: "Filter Change",
                dates: Date.now,
                serviceMileages: 12500,
                serviceCosts: 5
            ),
            Services(
                titles: "Tire Change",
                dates: Date.now,
                serviceMileages: 100000,
                serviceCosts: 12
            ),
        ]
    ),
    
    Cars(
        manufacturer: "Dodge",
        model: "Charger",
        yearManufactured: 1966,
        engine: "5.7L HEMI® V8",
        licensePlate: "619916",
        mileage: 0.0,
        cost: 12345.00,
        servicesList: [
            Services(
                titles: "Oil Change",
                dates: Date.now,
                serviceMileages: 12000,
                serviceCosts: 50
            ),
            Services(
                titles: "Filter Change",
                dates: Date.now,
                serviceMileages: 12500,
                serviceCosts: 5
            ),
            Services(
                titles: "Tire Change",
                dates: Date.now,
                serviceMileages: 100000,
                serviceCosts: 12
            ),
        ]
    ),
]
