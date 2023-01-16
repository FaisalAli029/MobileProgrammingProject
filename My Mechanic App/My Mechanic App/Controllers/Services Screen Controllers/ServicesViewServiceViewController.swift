import UIKit

class ServicesViewServiceViewController: UIViewController {
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var mileageTF: UITextField!
    @IBOutlet weak var costTF: UITextField!
    
    @IBOutlet weak var statusToggle: UISwitch!
    
    var isEditingProfile: Bool = false
    var selectedService: Service?
    var newService: Service?
    
    @IBAction func onEditBtnClicked(_ sender: UIBarButtonItem) {
        isEditingProfile = !isEditingProfile
        sender.title = isEditingProfile ? "Done" : "Edit"
        
        titleTF.isEnabled = isEditingProfile
        dateTF.isEnabled = isEditingProfile
        mileageTF.isEnabled = isEditingProfile
        costTF.isEnabled = isEditingProfile
        
        // When user clicks 'done', save the data
        if !isEditingProfile {
            dateFormatter.dateFormat = "yyyy-MM-dd @ HH:mm"
            let date: Date = dateFormatter.date(from: dateTF.text!) ?? Date.now
            
            newService = Service(
                title: (titleTF.text == nil || titleTF.text == "") ? "Untitled Service" : titleTF.text!,
                date: date,
                serviceMileage: Double(mileageTF.text ?? "0.0") ?? 0.0,
                serviceCost: Double(costTF.text ?? "0.0") ?? 0.0,
                isDone: false
            )
            
            updateService(newService: newService!)
        }
    }
    
    @IBAction func onCompletedStatusChanged(_ sender: UISwitch) {
        dateFormatter.dateFormat = "yyyy-MM-dd @ HH:mm"
        let date: Date = dateFormatter.date(from: dateTF.text!) ?? Date.now
        
        newService = Service(
            title: (titleTF.text == nil || titleTF.text == "") ? "Untitled Service" : titleTF.text!,
            date: date,
            serviceMileage: Double(mileageTF.text ?? "0.0") ?? 0.0,
            serviceCost: Double(costTF.text ?? "0.0") ?? 0.0,
            isDone: statusToggle.isOn
        )
        
        updateService(newService: newService!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectedService = myCarsData[selectedCarIndex].servicesList[selectedServiceIndex]
        
        dateFormatter.dateFormat = "yyyy-MM-dd @ HH:mm"
        
        titleTF.text = selectedService!.title
        dateTF.text = dateFormatter.string(from: selectedService!.date)
        mileageTF.text = String(selectedService!.serviceMileage)
        costTF.text = String(selectedService!.serviceCost)
        statusToggle.isOn = selectedService!.isDone
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self,
                             action: #selector(dateChange(datePicker:)),
                             for: UIControl.Event.valueChanged
        )
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        
        dateTF.inputView = datePicker
        dateTF.text = formatDate(date: selectedService!.date)
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        dateTF.text = formatDate(date: datePicker.date)
    }
        
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd @ HH:mm"
        return formatter.string(from: date)
    }
}
