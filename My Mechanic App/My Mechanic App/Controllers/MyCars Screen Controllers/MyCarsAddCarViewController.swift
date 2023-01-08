import UIKit

class MyCarsAddCarViewController: UIViewController {
    @IBOutlet weak var manufacturer: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var yearManufactured: UITextField!
    @IBOutlet weak var engine: UITextField!
    @IBOutlet weak var licensePlate: UITextField!
    @IBOutlet weak var mileage: UITextField!
    @IBOutlet weak var cost: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addCarBtn(_ sender: UIButton) {
        print("Add car button pressed")
        
        carsData.insert(
            Car(
                manufacturer: manufacturer.text ?? "",
                model: model.text ?? "",
                yearManufactured: Int(yearManufactured.text ?? "0") ?? 2000,
                engine: engine.text ?? "",
                licensePlate: licensePlate.text ?? "",
                mileage: Double(mileage.text ?? "0") ?? 0.0,
                cost: Double(cost.text ?? "0") ?? 0.0,
                servicesList: []
            ),
            at: carsData.count
        )
        
        print(carsData)
    }
}
