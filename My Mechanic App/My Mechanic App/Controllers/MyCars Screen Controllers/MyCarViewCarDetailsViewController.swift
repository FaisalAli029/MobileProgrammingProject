import UIKit
import CoreData
class MyCarViewCarDetailsViewController: UIViewController, UITextFieldDelegate {
    
  
    
    
    @IBOutlet weak var manufacturerTF: UITextField!
    @IBOutlet weak var modelTF: UITextField!
    @IBOutlet weak var yearManufacturedTF: UITextField!
    @IBOutlet weak var engineTF: UITextField!
    @IBOutlet weak var licensePlateTF: UITextField!
    @IBOutlet weak var mileageTF: UITextField!
    @IBOutlet weak var costTF: UITextField!
    
    var selectedCar: Car? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        manufacturerTF.delegate = self
        modelTF.delegate = self
        yearManufacturedTF.delegate = self
        mileageTF.delegate = self
        engineTF.delegate = self
        licensePlateTF.delegate = self
        costTF.delegate = self
        if(selectedCar != nil)
        {
            manufacturerTF.text = selectedCar?.manufacturer
            modelTF.text = selectedCar?.model
            yearManufacturedTF.text = selectedCar?.yearManufactured
            engineTF.text = selectedCar?.engine
            licensePlateTF.text = selectedCar?.licensePlate
            mileageTF.text = selectedCar?.mileage
            costTF.text = selectedCar?.cost
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    } //function to hide the keyboard when clicking on the return button
    
    
    @IBAction func saveCar(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        if(selectedCar == nil)
        {
            let entity = NSEntityDescription.entity(forEntityName: "Car", in: context)
            let newCar = Car(entity: entity!, insertInto: context)
            newCar.carID = carList.count as NSNumber
            newCar.manufacturer = manufacturerTF.text //giving values to the text fields from the inputed values
            newCar.model = modelTF.text
            newCar.mileage = mileageTF.text
            newCar.yearManufactured = yearManufacturedTF.text
            newCar.engine = engineTF.text
            newCar.licensePlate = licensePlateTF.text
            newCar.cost = costTF.text
            do{
                try context.save() //saving the context(entity)
                carList.append(newCar)
                navigationController?.popViewController(animated: true) //code to go back to the previous view controller
                
            }
            catch{
                print("context save error")
            }
        }
        else
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Car")
            do
            {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results{
                    let car = result as! Car
                    if(car == selectedCar)
                    {
                        car.manufacturer = manufacturerTF.text
                        car.model = modelTF.text
                        car.mileage = mileageTF.text
                        car.yearManufactured = yearManufacturedTF.text
                        car.engine = engineTF.text
                        car.licensePlate = licensePlateTF.text
                        car.cost = costTF.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            }
            catch{
                print("Fetch Failed")
            }
        }
    }
    
    

     
    @IBAction func deleteCar(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Car")
        do
        {
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results{
                let car = result as! Car
                if(car == selectedCar)
                {
                    car.deletedCar = Date()
                    navigationController?.popViewController(animated: true)
                }
            }
        }
        catch{
            print("Fetch Failed")
        }
    }
    
      
    }
    

