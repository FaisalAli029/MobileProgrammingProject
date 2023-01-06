import UIKit

class MyCarsMainScreenViewController: UIViewController {

    @IBOutlet weak var myCarsTableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    @IBAction func editBtn(_ sender: UIBarButtonItem) {
        myCarsTableView.isEditing = !myCarsTableView.isEditing
        sender.title = myCarsTableView.isEditing ? "Done" : "Edit"
        addBtn.isHidden = myCarsTableView.isEditing ? true : false
    }
    
    @IBAction func addCarBtn(_ sender: UIBarButtonItem) {
        print("car added")
    }
    
    // List to display 'MyCars'
    var myCarsList = carsData
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "MyCarTableViewCell", bundle: nil)
        myCarsTableView.register(nib, forCellReuseIdentifier: "carCell")
        myCarsTableView.delegate = self
        myCarsTableView.dataSource = self
    }
}

extension MyCarsMainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Total number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myCarsList.count
    }
    
    // Shows cell data and removes other cells from memory if they are NOT visible
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myCarsTableView.dequeueReusableCell(
            withIdentifier: "carCell",
            for: indexPath
        ) as! MyCarTableViewCell
        
        cell.manufacturerLabel.text = myCarsList[indexPath.row].manufacturer
        cell.modelTitleLabel.text = "Model:"
        cell.modelLabel.text = myCarsList[indexPath.row].model
        cell.licensePlateTitleLabel.text = "License Plate:"
        cell.licensePlateLabel.text = myCarsList[indexPath.row].licensePlate
        
        return cell
    }
    
    // On Cell Selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you have selected a cell. index = \(indexPath.row)")
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
    }
    
    // Delete or insert data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            myCarsList.remove(at: indexPath.row)
            myCarsTableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // do nothing
        }
    }
}
