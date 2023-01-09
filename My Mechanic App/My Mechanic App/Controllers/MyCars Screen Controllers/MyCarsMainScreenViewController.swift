//
//
//
//  Created by M.A on 07/01/2022.
//

import Foundation
import UIKit
import CoreData

var carList = [Car]() //declare a public array

class MyCarsMainScreenViewController: UITableViewController
{
    
    @IBOutlet var myCarsTableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    @IBAction func editBtnClicked(_ sender: UIBarButtonItem) {
        myCarsTableView.isEditing = !myCarsTableView.isEditing
        sender.title = myCarsTableView.isEditing ? "Done" : "Edit"
        addBtn.isHidden = myCarsTableView.isEditing ? true : false
    }
    var firstLoad = true
    func nonDeletedCars() -> [Car]
    { //view the list of non deleted services from an array
        var nonDeletedCarList = [Car]()
        for car in carList
        {
            if(car.deletedCar == nil)
            { //if deletedService is empty then append the list
                nonDeletedCarList.append(car)
            }
        }
        return nonDeletedCarList
    }
    override func viewDidLoad() {
        let nib = UINib(nibName: "MyCarTableViewCell", bundle: nil)
        myCarsTableView.register(nib, forCellReuseIdentifier: "carCell")
        myCarsTableView.delegate = self
        myCarsTableView.dataSource = self
        if(firstLoad)
        {
            //function to view the list of services from the memory(CoreData) into the table view cells
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Car")
            do
            {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results{
                    let car = result as! Car
                    carList.append(car)
                }
            }
            catch{
                print("Fetch Failed")
            }
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let carCell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! MyCarTableViewCell //declare table view cell with an identifier(identifier is placed in Main storyboard)
        
        let thisCar: Car!
        thisCar = nonDeletedCars()[indexPath.row] //get the current row from table view
        
        carCell.manufacturerLabel.text = thisCar.manufacturer //give the label in table view cell the value of the inputed title
        carCell.modelLabel.text = thisCar.model //give the next label in table view cell the value of the inputed date
        carCell.licensePlateLabel.text = thisCar.licensePlate
        
        return carCell //returning the table view cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nonDeletedCars().count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData() //triggers a refresh of the table view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showCarDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showCarDetails")
        {
            let indexPath = tableView.indexPathForSelectedRow!
            
            let carDetail = segue.destination as? MyCarViewCarDetailsViewController
            
            let selectedCar : Car!
            selectedCar = nonDeletedCars()[indexPath.row]
            carDetail!.selectedCar = selectedCar
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
    extension MyCarsMainScreenViewController {
        
        
        // Rows can be edited
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        // Order rows
        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let tempData = carList[sourceIndexPath.item]
            carList.remove(at: sourceIndexPath.item)
            carList.insert(tempData, at: destinationIndexPath.item)
        }
        
        // Delete or insert data
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                carList.remove(at: indexPath.row)
                myCarsTableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // do nothing
            }
        }
    }

