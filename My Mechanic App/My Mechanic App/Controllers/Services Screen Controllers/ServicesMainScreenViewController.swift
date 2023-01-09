import Foundation
import UIKit
import CoreData

class ServicesMainScreenViewController: UITableViewController {
    
    @IBOutlet var myServicesTableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    var servicesList: [Service] = []
    
    // When edit button is clicked, it will show hamburger icon to manually sort or delete services
    @IBAction func editBtnClicked(_ sender: UIBarButtonItem) {
        myServicesTableView.isEditing = !myServicesTableView.isEditing
        sender.title = myServicesTableView.isEditing ? "Done" : "Edit"
        addBtn.isHidden = myServicesTableView.isEditing ? true : false
    }
    
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
        
        print("")
        var counter: Int = 1
        for service in servicesList {
            print("Service #\(counter)")
            print("========")
            print(service.title)
            print(service.date)
            print(service.serviceMileage)
            print(service.serviceCost)
            print("")
            
            counter += 1
        }
        
        let nib = UINib(nibName: "ServiceTableViewCell", bundle: nil)
        myServicesTableView.register(nib, forCellReuseIdentifier: "serviceCell")
        myServicesTableView.delegate = self
        myServicesTableView.dataSource = self
        
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

// For things related to the table view
extension ServicesMainScreenViewController {
    
    // Total number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        servicesList.count
    }
    
    // Shows cell data and removes other cells from memory if they are NOT visible
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myServicesTableView.dequeueReusableCell(
            withIdentifier: "serviceCell",
            for: indexPath
        ) as! ServiceTableViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        cell.title.text = servicesList[indexPath.row].title
        cell.date.text = dateFormatter.string(from: servicesList[indexPath.row].date)
        
        print("rewhe \(dateFormatter.string(from: servicesList[indexPath.row].date))")
        
        return cell
    }
    
    // Rows can be edited
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
    
    // Order rows
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tempData = servicesList[sourceIndexPath.item]
        servicesList.remove(at: sourceIndexPath.item)
        servicesList.insert(tempData, at: destinationIndexPath.item)
    }
    
    // Delete or insert data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            servicesList.remove(at: indexPath.row)
            myServicesTableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // do nothing
        }
    }
}
