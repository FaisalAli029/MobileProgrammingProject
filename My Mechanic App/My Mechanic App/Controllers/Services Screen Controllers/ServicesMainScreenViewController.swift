import UIKit

class ServicesMainScreenViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet var myServicesTableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    let searchController = UISearchController()
    
    var servicesList: [Service] = []
    
    var filteredServices = myCarsData[selectedCarIndex].servicesList
    
    // When edit button is clicked, it will show hamburger icon to manually sort or delete services
    @IBAction func editBtnClicked(_ sender: UIBarButtonItem) {
        myServicesTableView.isEditing = !myServicesTableView.isEditing
        sender.title = myServicesTableView.isEditing ? "Done" : "Edit"
        addBtn.isHidden = myServicesTableView.isEditing ? true : false
    }
    
    @IBAction func unwindToServicesScreen(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchController()
        //print("")
        //var counter: Int = 1
        //for service in servicesList {
        //    print("Service #\(counter)")
        //    print("========")
        //    print(service.title)
        //    print(service.date)
        //    print(service.serviceMileage)
        //    print(service.serviceCost)
        //    print("")
        //    counter += 1
        //}
        
        let nib = UINib(nibName: "ServiceTableViewCell", bundle: nil)
        myServicesTableView.register(nib, forCellReuseIdentifier: "serviceCell")
        myServicesTableView.delegate = self
        myServicesTableView.dataSource = self
    }
    
    func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.placeholder = "Title, Date"
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Title A-Z", "Title Z-A", "Recent-Old", "Old-Recent"]
        searchController.searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        servicesList = myCarsData[selectedCarIndex].servicesList
        myServicesTableView.reloadData()
    }
}

// For things related to the table view
extension ServicesMainScreenViewController {
    
    // Total number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive) {
            return filteredServices.count
        }
        return servicesList.count
    }
    
    // Shows cell data and removes other cells from memory if they are NOT visible
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myServicesTableView.dequeueReusableCell(
            withIdentifier: "serviceCell",
            for: indexPath
        ) as! ServiceTableViewCell
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if (searchController.isActive) {
            cell.title.text = filteredServices[indexPath.row].title
            cell.date.text = dateFormatter.string(from: filteredServices[indexPath.row].date)
        }else{
            cell.title.text = servicesList[indexPath.row].title
            cell.date.text = dateFormatter.string(from: servicesList[indexPath.row].date)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedServiceIndex = indexPath.row
        performSegue(withIdentifier: "showServiceDetails", sender: self)
    }
    
    // Rows can be edited
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Row height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
    
    // Order rows
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tempData = servicesList[sourceIndexPath.item]
        servicesList.remove(at: sourceIndexPath.item)
        servicesList.insert(tempData, at: destinationIndexPath.item)
        
        updateSerivcesListStored(servicesList: servicesList)
        myServicesTableView.reloadData()
    }
    
    // Delete or insert data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            servicesList.remove(at: indexPath.row)
            myServicesTableView.deleteRows(at: [indexPath], with: .fade)
            
            updateSerivcesListStored(servicesList: servicesList)
            myServicesTableView.reloadData()
        } else if editingStyle == .insert {
            // do nothing
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        
        let searchText = searchBar.text!
        
        filterForSearchTextAndSearchButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    func filterForSearchTextAndSearchButton(searchText: String, scopeButton: String = "All") {
        filteredServices = myCarsData[selectedCarIndex].servicesList.filter({ service in
            var searchTextMatch: Bool = true
            if (searchController.searchBar.text != "") {
                searchTextMatch = (service.title.lowercased().contains(searchText.lowercased()) || service.date.description.contains(searchText))
            }
            return searchTextMatch
        })
        if(scopeButton.lowercased() == "title a-z") {
            filteredServices = filteredServices.sorted { $0.title.lowercased() < $1.title.lowercased() }
        }else if (scopeButton.lowercased() == "title z-a") {
            filteredServices = filteredServices.sorted { $0.title.lowercased() > $1.title.lowercased() }
        }else if (scopeButton.lowercased() == "recent-old") {
            filteredServices = filteredServices.sorted { $0.date > $1.date }
        }else if (scopeButton.lowercased() == "old-recent") {
            filteredServices = filteredServices.sorted { $0.date < $1.date}
        }
        myServicesTableView.reloadData()
    }
}
