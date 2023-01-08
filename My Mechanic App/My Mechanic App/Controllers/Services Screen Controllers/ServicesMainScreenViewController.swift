//
//  ServiceTableView.swift
//  Services
//
//  Created by M.A on 07/01/2022.
//

import Foundation
import UIKit
import CoreData

var serviceList = [Service]() //declare a public array - Omar Alshams

class ServicesMainScreenViewController: UITableViewController
{
//    var firstLoad = true
//    func nonDeletedServices() -> [Service]
//    { //view the list of non deleted services from an array
//        var nonDeletedServiceList = [Service]()
//        for service in serviceList
//        {
//            if(service.deletedService == nil)
//            { //if deletedService is empty then append the list
//                nonDeletedServiceList.append(service)
//            }
//        }
//        return nonDeletedServiceList
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        if(firstLoad)
//        {
//            //function to view the list of services from the memory(CoreData) into the table view cells - Omar Alshams
//            firstLoad = false
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Service")
//            do
//            {
//                let results:NSArray = try context.fetch(request) as NSArray
//                for result in results{
//                    let service = result as! Service
//                    serviceList.append(service)
//                }
//            }
//            catch{
//                print("Fetch Failed")
//            }
//        }
    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //Omar Alshams feature
//        let serviceCell = tableView.dequeueReusableCell(withIdentifier: "serviceCellID", for: indexPath) as! ServiceCell //declare table view cell with an identifier(identifier is placed in Main storyboard) - Omar Alshams
//        
//        let thisService: Service!
//        thisService = nonDeletedServices()[indexPath.row] //get the current row from table view - Omar Alshams
//        
//        serviceCell.titleLabel.text = thisService.title //give the label in table view cell the value of the inputed title - Omar Alshams
//        serviceCell.dateLabel.text = thisService.date //give the next label in table view cell the value of the inputed date - Omar Alshams
//        
//        return serviceCell //returning the table view cell - Omar Alshams
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return nonDeletedServices().count
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData() //triggers a refresh of the table view - Omar Alshams
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //clicking on a service will perform a segue to show the next view controller(the view controller storing the details of the service) - Mohamed Alhusaini
//        self.performSegue(withIdentifier: "editService", sender: self)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "editService")
//        { //shows the details of the selected service in the view controller(ServiceDetailVC) - Mohamed Alhusaini
//            let indexPath = tableView.indexPathForSelectedRow!
//            
//            let serviceDetail = segue.destination as? ServiceDetailVC
//            
//            let selectedService : Service!
//            selectedService = nonDeletedServices()[indexPath.row]
//            serviceDetail!.selectedService = selectedService
//            
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//    }
}
