//
//  ViewController.swift
//  Services
//
//  Created by M.A on 07/01/2022.
//

import UIKit
import CoreData

class ServiceDetailsViewController: UIViewController, UITextFieldDelegate {
    //create outlets for the text fields
//    @IBOutlet weak var titleTF: UITextField!
//    @IBOutlet weak var dateTF: UITextField!
//    @IBOutlet weak var mileageTF: UITextField!
//    @IBOutlet weak var totalCostTF: UITextField!
//
//    var selectedService: Service? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        titleTF.delegate = self //to close the keyboard of the text field - Omar Alshams
//        dateTF.delegate = self
//        mileageTF.delegate = self
//        totalCostTF.delegate = self
//        if(selectedService != nil) //view details of the selected service - Mohamed Alhusaini
//        {
//            titleTF.text = selectedService?.title
//            dateTF.text = selectedService?.date
//            mileageTF.text = selectedService?.mileage
//            totalCostTF.text = selectedService?.totalCost
//        }
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    } //function to hide the keyboard when clicking on the return button - Omar Alshams
//    @IBAction func saveAction(_ sender: Any)
//    {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext //creating context to save the entity - Omar Alshams
//        if(selectedService == nil) //if the selected service is a new service - Omar Alshams
//        {
//            let entity = NSEntityDescription.entity(forEntityName: "Service", in: context) //create the Service entity - Omar Alshams
//            let newService = Service(entity: entity!, insertInto: context) //creating newService to insert a service into the entity - Omar Alshams
//            newService.id = serviceList.count as NSNumber //incrementing a new service through id - Omar Alshams
//            newService.title = titleTF.text //giving values to the text fields from the inputed values - Omar Alshams
//            newService.date = dateTF.text
//            newService.mileage = mileageTF.text
//            newService.totalCost = totalCostTF.text
//            do{
//                try context.save() //saving the context(entity) - Omar Alshams
//                serviceList.append(newService) //append the service list in the memory(storage) - Omar Alshams
//                navigationController?.popViewController(animated: true) //code to go back to the previous view controller - Omar Alshams
//
//            }
//            catch{
//                print("context save error")
//            }
//        }
//        else //since the service is not a new service we will be editing the service details - Omar Alshams
//        {
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Service")
//            do
//            {
//                let results:NSArray = try context.fetch(request) as NSArray
//                for result in results{
//                    let service = result as! Service
//                    if(service == selectedService)//shows the details of the selected services and be able to edit them
//                    {
//                        service.title = titleTF.text
//                        service.date = dateTF.text
//                        service.mileage = mileageTF.text
//                        service.totalCost = totalCostTF.text
//                        try context.save()
//                        navigationController?.popViewController(animated: true)
//                    }
//                }
//            }
//            catch{
//                print("Fetch Failed")
//            }
//        }
//    }
//
//    @IBAction func DeleteService(_ sender: Any)
//    {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Service")
//        do
//        {
//            let results:NSArray = try context.fetch(request) as NSArray
//            for result in results{
//                let service = result as! Service
//                if(service == selectedService)
//                {
//                    service.deletedService = Date() //deleting the selected service - Omar Alshams
//                    try context.save() //saving the memory - Omar Alshams
//                    navigationController?.popViewController(animated: true) //show the previous controller(list of services)
//                }
//            }
//        }
//        catch{
//            print("Fetch Failed")
//        }
//    }
}

