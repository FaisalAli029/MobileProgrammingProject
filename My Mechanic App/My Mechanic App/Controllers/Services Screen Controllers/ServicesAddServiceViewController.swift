import UIKit

class ServicesAddServiceViewController: UIViewController {
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var mileageTF: UITextField!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var costTF: UITextField!
    
    var newService: Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self,
                             action: #selector(dateChange(datePicker:)),
                             for: UIControl.Event.valueChanged
        )
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        
        dateTF.inputView = datePicker
        dateTF.text = formatDate(date: Date())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        costLabel.text = "Service cost (\(getCurrencyStr()))"
        costTF.placeholder = "E.g. \(getCurrencyStr()) 13.000"
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        dateTF.text = formatDate(date: datePicker.date)
    }
        
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd @ \(getTimeFormatStr())"
        return formatter.string(from: date)
    }
    
    // Saves the service to storage
    @IBAction func addServiceBtnClicked(_ sender: UIButton) {
        dateFormatter.dateFormat = "yyyy-MM-dd @ \(getTimeFormatStr())"
        let date: Date = dateFormatter.date(from: dateTF.text!) ?? Date.now
        
        newService = Service(
            title: (titleTF.text == nil || titleTF.text == "") ? "Untitled Service" : titleTF.text!,
            date: date,
            serviceMileage: Double(mileageTF.text ?? "0.0") ?? 0.0,
            serviceCost: Double(costTF.text ?? "0.0") ?? 0.0,
            isDone: false
        )
        
        // If USD is selected
        if currency == 1 {
            newService?.serviceCost = convertToBHD(value: Double(costTF.text!) ?? 0.0)
        }
        
        addServiceToLocalStorage(serviceData: newService!)
    }
    
    // To update the 'My Services' screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ServicesMainScreenViewController
        vc.servicesList.append(newService!)
    }

}
