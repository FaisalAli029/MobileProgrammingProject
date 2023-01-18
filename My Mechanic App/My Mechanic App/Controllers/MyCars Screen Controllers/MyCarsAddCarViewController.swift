import UIKit

class MyCarsAddCarViewController: UIViewController {
    @IBOutlet weak var manufacturer: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var yearManufactured: UITextField!
    @IBOutlet weak var engine: UITextField!
    @IBOutlet weak var licensePlate: UITextField!
    @IBOutlet weak var mileage: UITextField!
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var costLabel: UILabel!
    
    var newCar: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        costLabel.text = "Cost (\(getCurrencyStr()))"
        cost.placeholder = "E.g. \(getCurrencyStr()) 123456.00"
    }

    // When user presses add car button, new car data should be stored
    @IBAction func addCarBtn(_ sender: UIButton) {
        newCar = Car(
            manufacturer: manufacturer.text ?? "",
            model: model.text ?? "",
            yearManufactured: Int(yearManufactured.text ?? "0") ?? 2000,
            engine: engine.text ?? "",
            licensePlate: licensePlate.text ?? "",
            mileage: Double(mileage.text ?? "0") ?? 0.0,
            cost: Double(cost.text ?? "0") ?? 0.0,
            servicesList: []
        )
        
        // If USD is selected
        if currency == 1 {
            newCar?.cost = convertToBHD(value: Double(cost.text!) ?? 0.0)
        }
        
        addCarToLocalStorage(carData: newCar!)
    }
    
    // To update the 'My Cars' screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MyCarsMainScreenViewController
        vc.myCarsList.append(newCar!)
    }
}
