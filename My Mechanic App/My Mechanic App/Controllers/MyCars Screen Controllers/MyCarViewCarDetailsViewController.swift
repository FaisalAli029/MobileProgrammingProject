import UIKit

class MyCarViewCarDetailsViewController: UIViewController {
    @IBOutlet weak var manufacturerTF: UITextField!
    @IBOutlet weak var modelTF: UITextField!
    @IBOutlet weak var yearManufacturedTF: UITextField!
    @IBOutlet weak var engineTF: UITextField!
    @IBOutlet weak var licensePlateTF: UITextField!
    @IBOutlet weak var mileageTF: UITextField!
    @IBOutlet weak var costTF: UITextField!
    
    var isEditingProfile: Bool = false
    var carDetails: Car?
    var newCar: Car?
    
    @IBAction func onEditBtnClicked(_ sender: UIBarButtonItem) {
        isEditingProfile = !isEditingProfile
        sender.title = isEditingProfile ? "Done" : "Edit"
        
        manufacturerTF.isEnabled = isEditingProfile
        modelTF.isEnabled = isEditingProfile
        yearManufacturedTF.isEnabled = isEditingProfile
        engineTF.isEnabled = isEditingProfile
        licensePlateTF.isEnabled = isEditingProfile
        mileageTF.isEnabled = isEditingProfile
        costTF.isEnabled = isEditingProfile
        
        // When user clicks 'done', save the data
        if !isEditingProfile {
            newCar = Car(
                manufacturer: manufacturerTF.text ?? "",
                model: modelTF.text ?? "",
                yearManufactured: Int(yearManufacturedTF.text ?? "0") ?? 2000,
                engine: engineTF.text ?? "",
                licensePlate: licensePlateTF.text ?? "",
                mileage: Double(mileageTF.text ?? "0") ?? 0.0,
                cost: Double(costTF.text ?? "0") ?? 0.0,
                servicesList: []
            )
            
            updateCar(newCar: newCar!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        manufacturerTF.text = carDetails!.manufacturer
        modelTF.text = carDetails!.model
        yearManufacturedTF.text = String(carDetails!.yearManufactured)
        engineTF.text = carDetails!.engine
        licensePlateTF.text = carDetails!.licensePlate
        mileageTF.text = String(carDetails!.mileage)
        costTF.text = String(carDetails!.cost)
    }
    
    // Redirects to the 'Services' screen when the button is clicked
    @IBAction func viewServicesBtnClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showServices", sender: self)
    }
}
