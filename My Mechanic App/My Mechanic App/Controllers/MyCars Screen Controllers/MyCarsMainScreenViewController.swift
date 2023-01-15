import UIKit
import UserNotifications

class MyCarsMainScreenViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var myCarsTableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    // creating the search bar controller
    let searchController = UISearchController()
    
    @IBAction func editBtn(_ sender: UIBarButtonItem) {
        myCarsTableView.isEditing = !myCarsTableView.isEditing
        sender.title = myCarsTableView.isEditing ? "Done" : "Edit"
        addBtn.isHidden = myCarsTableView.isEditing ? true : false
    }
    
    // List to display 'MyCars'
    var myCarsList = myCarsData
    
    // Will be passed to the 'View Car Details' screen
    var selectedCar: Car?
    
    // List of filtered cars
    var filteredCarsList = myCarsData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initilize the search controller
        initSearchController()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "MyCarTableViewCell", bundle: nil)
        myCarsTableView.register(nib, forCellReuseIdentifier: "carCell")
        myCarsTableView.delegate = self
        myCarsTableView.dataSource = self
    }
    // the initilizer that sets up the search bar including the scope buttons under it
    func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.placeholder = "Menufacturer, Model, Licence Plate"
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Sorted A-Z", "Sorted Z-A"]
        searchController.searchBar.delegate = self
    }
    
    func notifications(myCar: Car) {
        var carManufacturer: String
        var serviceTitle: String
        var serviceDate: Date
        var serviceCost: Double
        
        carManufacturer = myCar.manufacturer
        
        for service in myCar.servicesList {
            if !service.isDone {
                
                serviceTitle = service.title
                serviceDate = service.date
                serviceCost = service.serviceCost
                
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(
                    options: [.alert, .badge, .sound]) { (granted, error) in
                        //error != nil ? print(error!) : nil
                }
                
                let content = UNMutableNotificationContent()
                content.title = "\(serviceTitle) for \(carManufacturer) due tomorrow"
                content.body = """
                Your service is scheduled for \(serviceDate).
                The total cost of the service is BHD \(serviceCost).
                """
                
                // Use this date for testing
                //let date = Date().addingTimeInterval(10)
                
                var date: Date = Date()
                if let tempDate = Calendar.current.date(byAdding: .day, value: -1, to: serviceDate) {
                    date = tempDate
                }
                
                let dateComponents = Calendar.current.dateComponents(
                    [.year, .month, .day, .hour, .minute, .second],
                    from: date
                )
                
                let trigger = UNCalendarNotificationTrigger(
                    dateMatching: dateComponents,
                    repeats: false
                )
                
                let notificationID = UUID().uuidString
                let request = UNNotificationRequest(
                    identifier: notificationID,
                    content: content,
                    trigger: trigger
                )
                
                center.add(request) {
                    (error) in
                }
            }
        }
    }
    
    // When user is redirected to this screen from any other screen like: 'Add Car' screen
    // the table data should be updated (reloaded)
    override func viewWillAppear(_ animated: Bool) {
        
        // Load Car(s) data from local storage
        myCarsList = readCarsData()
        
        myCarsData = myCarsList
        myCarsTableView.reloadData()
        
        for car in myCarsData {
            notifications(myCar: car)
        }
    }
    
    // When user adds a new car, the user will be redirected from the 'add car' screen to here with the updated cars list
    @IBAction func unwindToMyCarsScreen(_ sender: UIStoryboardSegue) {}
    
    // Temporarily stores information unitl a button (usually) is clicked
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // When the user clicks on any of the car rows
        if segue.identifier == "showCarDetails" {
            if let vc = segue.destination as? MyCarViewCarDetailsViewController {
                // The variable [carDetails] in the 'MyCarViewCarDetailsViewController' will be set to the following
                vc.carDetails = selectedCar
            }
        }
        
        myCarsData = myCarsList // Updates the GLOBAL MyCars List
    }
}

extension MyCarsMainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Total number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchController.isActive) {
            return filteredCarsList.count
        }
        return myCarsList.count
    }
    
    // Shows cell data and removes other cells from memory if they are NOT visible
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myCarsTableView.dequeueReusableCell(
            withIdentifier: "carCell",
            for: indexPath
        ) as! MyCarTableViewCell
        
        if(searchController.isActive) {
            cell.manufacturerLabel.text = filteredCarsList[indexPath.row].manufacturer
            cell.modelTitleLabel.text = "Model:"
            cell.modelLabel.text = filteredCarsList[indexPath.row].model
            cell.licensePlateTitleLabel.text = "License Plate:"
            cell.licensePlateLabel.text = filteredCarsList[indexPath.row].licensePlate
        }
        else {
            cell.manufacturerLabel.text = myCarsList[indexPath.row].manufacturer
            cell.modelTitleLabel.text = "Model:"
            cell.modelLabel.text = myCarsList[indexPath.row].model
            cell.licensePlateTitleLabel.text = "License Plate:"
            cell.licensePlateLabel.text = myCarsList[indexPath.row].licensePlate
        }
        return cell
    }
    
    // On Cell Selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(searchController.isActive) {
            selectedCar = filteredCarsList[indexPath.row]
            selectedCarIndex = indexPath.row // Updates the GLOBAL selected car
        }else {
            selectedCar = myCarsList[indexPath.row]
            selectedCarIndex = indexPath.row // Updates the GLOBAL selected car
        }
        
        self.performSegue(withIdentifier: "showCarDetails", sender: self)
    }
    
    // Rows can be edited
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Order rows
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tempData = myCarsList[sourceIndexPath.item]
        myCarsList.remove(at: sourceIndexPath.item)
        myCarsList.insert(tempData, at: destinationIndexPath.item)
        
        updateCarsListStored(carsList: myCarsList)
        myCarsTableView.reloadData()
    }
    
    // Delete or insert data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            myCarsList.remove(at: indexPath.row)
            myCarsTableView.deleteRows(at: [indexPath], with: .fade)
            
            updateCarsListStored(carsList: myCarsList)
            myCarsTableView.reloadData()
        } else if editingStyle == .insert {
            // do nothing
        }
    }
    
    // this function updates the results from the search bar based on the text inside the search text field and the scope buttons
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        
        let searchText = searchBar.text!
        
        filterForSearchTextAndSearchButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    //
    func filterForSearchTextAndSearchButton(searchText: String, scopeButton: String = "All") {
        filteredCarsList = myCarsList.filter({ car in
            var searchTextMatch: Bool = true
            if (searchController.searchBar.text != "") {
                searchTextMatch = (car.manufacturer.lowercased().contains(searchText.lowercased()) || car.model.lowercased().contains(searchText.lowercased()) || car.licensePlate.contains(searchText))
            }
            return searchTextMatch
        })
        if(scopeButton.lowercased() == "sorted a-z") {
            filteredCarsList = filteredCarsList.sorted { $0.manufacturer.lowercased() < $1.manufacturer.lowercased() }
        }else if (scopeButton.lowercased() == "sorted z-a") {
            filteredCarsList = filteredCarsList.sorted { $0.manufacturer.lowercased() > $1.manufacturer.lowercased() }
        }
        myCarsTableView.reloadData()
    }
}
