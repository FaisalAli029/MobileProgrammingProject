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
            newService = Service(
                title: (titleTF.text == nil || titleTF.text == "") ? "Untitled Service" : titleTF.text!,
                date: dateFormatter.date(from: dateTF.text ?? "2023-05-05") ?? Date(), // default date: 2023-05-05
                serviceMileage: Double(mileageTF.text ?? "0.0") ?? 0.0,
                serviceCost: Double(costTF.text ?? "0.0") ?? 0.0,
                isDone: false
            )
            
            updateService(newService: newService!)
        }
    }
    
    @IBAction func onCompletedStatusChanged(_ sender: UISwitch) {
        newService = Service(
            title: (titleTF.text == nil || titleTF.text == "") ? "Untitled Service" : titleTF.text!,
            date: dateFormatter.date(from: dateTF.text ?? "2023-05-05") ?? Date(), // default date: 2023-05-05
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
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        titleTF.text = selectedService!.title
        dateTF.text = dateFormatter.string(from: selectedService!.date)
        mileageTF.text = String(selectedService!.serviceMileage)
        costTF.text = String(selectedService!.serviceCost)
        statusToggle.isOn = selectedService!.isDone
    }
}
