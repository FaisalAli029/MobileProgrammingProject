import UIKit

class RegistrationScreenViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTF.delegate = self
        passwordTF.delegate = self
        fullnameTF.delegate = self
        ageTF.delegate = self
        addressTF.delegate = self
    }
    
    // To dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func onRegister(_ sender: UIButton) {
        let myNewProfile: Profile = Profile(
            email: emailTF.text ?? "",
            password: passwordTF.text ?? "",
            fullName: fullnameTF.text ?? "",
            age: ageTF.text ?? "",
            address: addressTF.text ?? "",
            carsList: []
        )
        
        if myNewProfile.password.count < 6 {
            let alert = UIAlertController(
                title: "Short Password",
                message: "You password must contain at least six characters.",
                preferredStyle: .alert)
            
            // When clicked, does nothing
            alert.addAction(UIAlertAction(title: "Fix now!", style: .default, handler: { _ in }))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // Creates user if it doesn't exist
        if !checkUserExistence(userInfo: myNewProfile) {
            registerUserInfo(profileInfo: myNewProfile)
            performSegue(withIdentifier: "unwind", sender: self)
        } else {
            //print("User already exists")
            let alert = UIAlertController(
                title: "User Already Exists",
                message: "A user with this email address already exists.",
                preferredStyle: .alert)
            
            // When clicked, does nothing
            alert.addAction(UIAlertAction(title: "Fix now!", style: .default, handler: { _ in }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
