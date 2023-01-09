/* import UIKit
import CoreData
class MyCarsAddCarViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var manufacturer: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var yearManufactured: UITextField!
    @IBOutlet weak var engine: UITextField!
    @IBOutlet weak var licensePlate: UITextField!
    @IBOutlet weak var mileage: UITextField!
    @IBOutlet weak var cost: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manufacturer.delegate = self
        model.delegate = self
        yearManufactured.delegate = self
        mileage.delegate = self
        engine.delegate = self
        licensePlate.delegate = self
        cost.delegate = self
        if(selectedCar == nil)
        {
            manufacturer.text = selectedCar?.manufacturer
            model.text = selectedCar?.model
            yearManufactured.text = selectedCar?.yearManufactured
            engine.text = selectedCar?.engine
            licensePlate.text = selectedCar?.licensePlate
            mileage.text = selectedCar?.mileage
            cost.text = selectedCar?.cost
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
  /*  @IBAction func addCarBtn(_ sender: Any) {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedCar == nil){
            let entity = NSEntityDescription.entity(forEntityName: "Car", in: context)
            let newCar = Car(entity: entity!, insertInto: context)
            newCar.carID = carList.count as NSNumber
            newCar.manufacturer = manufacturer.text
            newCar.model = model.text
            newCar.yearManufactured = yearManufactured.text
            newCar.engine = engine.text
            newCar.mileage = mileage.text
            newCar.cost = cost.text
            do{
                try context.save()
                carList.append(newCar)
                navigationController?.popViewController(animated: true)
                
            }
            catch{
                print("context save error")
            }
        }
            
          //  print(carsData)
        } */
    }

*/
