import UIKit

class MyCarViewCarDetailsViewController: UIViewController {
    
    // The car details that has been passed
    var carDetails: Car?
    
    @IBOutlet weak var manufacturerTF: UITextField!
    @IBOutlet weak var modelTF: UITextField!
    @IBOutlet weak var yearManufacturedTF: UITextField!
    @IBOutlet weak var engineTF: UITextField!
    @IBOutlet weak var licensePlateTF: UITextField!
    @IBOutlet weak var mileageTF: UITextField!
    @IBOutlet weak var costTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // To test if data is passed correctly
        // ======
        //print("")
        //print("Manufacturer: \(carDetails!.manufacturer)")
        //print("Model: \(carDetails!.model)")
        //print("Year Manufactured: \(carDetails!.yearManufactured)")
        //print("Engine: \(carDetails!.engine)")
        //print("License Plate: \(carDetails!.licensePlate)")
        //print("Mileage: \(carDetails!.mileage)")
        //print("Car Price: \(carDetails!.cost)")
        //print("Services List: \(carDetails!.servicesList)")
        //print("")
        // === END OF TESTING ===
        
        // Setting the text fields based upon the car details passed
        // ======
        manufacturerTF.text = carDetails!.manufacturer
        modelTF.text = carDetails!.model
        yearManufacturedTF.text = String(carDetails!.yearManufactured)
        engineTF.text = carDetails!.engine
        licensePlateTF.text = carDetails!.licensePlate
        mileageTF.text = String(carDetails!.mileage)
        costTF.text = String(carDetails!.cost)
        // === END OF UPDATING FIELDS ===
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showServices" {
            if let vc = segue.destination as? ServicesMainScreenViewController {
                vc.servicesList = carDetails!.servicesList
            }
        }
    }
    
    // Redirects to the 'Services' screen when the button is clicked
    @IBAction func viewServicesBtnClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showServices", sender: self)
    }
}
