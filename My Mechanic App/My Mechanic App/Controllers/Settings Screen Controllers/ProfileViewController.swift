import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    var myProfile: Person = Person(
        fullName: "John Wick",
        email: "john.wick@email.com",
        age: "43",
        address: "Home, Sweet Home"
    )
    
    @IBOutlet weak var fullNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    var isEditingProfile: Bool = false
    
    // When edit button is clicked, user should be allowed to update their profile settings
    @IBAction func editBtnClicked(_ sender: UIBarButtonItem) {
        isEditingProfile = !isEditingProfile
        sender.title = isEditingProfile ? "Done" : "Edit"
        
        fullNameLabel.isEnabled = isEditingProfile
        emailLabel.isEnabled = isEditingProfile
        ageLabel.isEnabled = isEditingProfile
        addressLabel.isEnabled = isEditingProfile
        
        // When user clicks 'done'
        if !isEditingProfile {
            let documentsDirectory = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first!
            
            let archiveURL = documentsDirectory
                .appendingPathComponent("userInfo")
                .appendingPathExtension("plist")
            
            let propertyListEncoder = PropertyListEncoder()
            
            let encodedData = try? propertyListEncoder.encode(myProfile)
            try? encodedData?.write(to: archiveURL, options: .noFileProtection)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullNameLabel.delegate = self
        emailLabel.delegate = self
        ageLabel.delegate = self
        addressLabel.delegate = self
        
        // TODO: load user info by decoding
        let documentsDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first!
        
        let archiveURL = documentsDirectory
            .appendingPathComponent("userInfo")
            .appendingPathExtension("plist")
        
        let propertyListDecoder = PropertyListDecoder()
        
        if let retrievedUserInfo = try? Data(contentsOf: archiveURL),
           let decodedUserInfo = try? propertyListDecoder
            .decode(
                Person.self,
                from: retrievedUserInfo
           )
        {
            print(decodedUserInfo)
            fullNameLabel.text = decodedUserInfo.fullName
            emailLabel.text = decodedUserInfo.email
            ageLabel.text = decodedUserInfo.age
            addressLabel.text = decodedUserInfo.address
        }
    }
    
    // To dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // On Text Fields Changed
    
    @IBAction func onFullnameChanged(_ sender: UITextField) {
        print(sender.text!)
        myProfile.fullName = sender.text!
    }
    
    @IBAction func onEmailChanged(_ sender: UITextField) {
        print(sender.text!)
        myProfile.email = sender.text!
    }
    
    @IBAction func onAgeChanged(_ sender: UITextField) {
        print(sender.text!)
        myProfile.age = sender.text!
    }
    
    @IBAction func onAddressChanged(_ sender: UITextField) {
        print(sender.text!)
        myProfile.address = sender.text!
    }
}
