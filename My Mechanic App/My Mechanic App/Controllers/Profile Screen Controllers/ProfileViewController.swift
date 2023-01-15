import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fullNameLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    var isEditingProfile: Bool = false
    var myProfile: Profile?
    
    // When edit button is clicked, user should be allowed to update their profile settings
    @IBAction func editBtnClicked(_ sender: UIBarButtonItem) {
        isEditingProfile = !isEditingProfile
        sender.title = isEditingProfile ? "Done" : "Edit"
        
        fullNameLabel.isEnabled = isEditingProfile
        usernameLabel.isEnabled = isEditingProfile
        ageLabel.isEnabled = isEditingProfile
        addressLabel.isEnabled = isEditingProfile
        
        // When user clicks 'done', save the data
        if !isEditingProfile {
            updateUserProfile(updatedProfile: myProfile!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullNameLabel.delegate = self
        usernameLabel.delegate = self
        ageLabel.delegate = self
        addressLabel.delegate = self
        
        // Read user data from local storage
        myProfile = profilesData[selectedProfileIndex]
        
        fullNameLabel.text = myProfile!.fullName
        usernameLabel.text = myProfile!.username
        ageLabel.text = myProfile!.age
        addressLabel.text = myProfile!.address
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MainScreenViewController {
            // TODO: edit local storage login status
            UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
            vc.isLoggedIn = false
        }
    }
    
    // To dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // On Text Fields Changed
    
    @IBAction func onFullnameChanged(_ sender: UITextField) {
        //print(sender.text!)
        myProfile!.fullName = sender.text!
    }
    
    @IBAction func onEmailChanged(_ sender: UITextField) {
        //print(sender.text!)
        myProfile!.username = sender.text!
    }
    
    @IBAction func onAgeChanged(_ sender: UITextField) {
        //print(sender.text!)
        myProfile!.age = sender.text!
    }
    
    @IBAction func onAddressChanged(_ sender: UITextField) {
        //print(sender.text!)
        myProfile!.address = sender.text!
    }
}
