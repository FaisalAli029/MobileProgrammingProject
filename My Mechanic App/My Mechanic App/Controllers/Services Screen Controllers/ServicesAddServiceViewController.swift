import UIKit

class ServicesAddServiceViewController: UIViewController {
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var mileageTF: UITextField!
    @IBOutlet weak var costTF: UITextField!
    
    var newService: Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addServiceBtnClicked(_ sender: UIButton) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        newService = Service(
            title: (titleTF.text == nil || titleTF.text == "") ? "Untitled Service" : titleTF.text!,
            date: dateFormatter.date(from: dateTF.text ?? "2023-05-05") ?? Date(), // default date: 2023-05-05
            serviceMileage: Double(mileageTF.text ?? "0.0") ?? 0.0,
            serviceCost: Double(costTF.text ?? "0.0") ?? 0.0,
            isDone: false
        )
        
        addServiceToLocalStorage(serviceData: newService!)
    }
    
    // To update the 'My Services' screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ServicesMainScreenViewController
        vc.servicesList.append(newService!)
    }

}
