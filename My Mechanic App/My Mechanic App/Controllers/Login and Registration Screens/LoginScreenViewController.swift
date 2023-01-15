import UIKit

class LoginScreenViewController: UIViewController, UITextFieldDelegate {
    
    var isSignInSuccessful: Bool = true
    var storedProfiles: [Profile] = []
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        storedProfiles = readUsersListStored()
        //print(storedProfiles)
    }
    
    @IBAction func onSignIn(_ sender: UIButton) {
        var counter: Int = 0
        for profile in storedProfiles {
            if profile.username == usernameTF.text && profile.password == passwordTF.text {
                isSignInSuccessful = true
                UserDefaults.standard.setValue(isSignInSuccessful, forKey: "isLoggedIn")
                selectedProfileIndex = counter
                performSegue(withIdentifier: "unwind", sender: self)
                return
            }
            counter += 1
        }
        
        // This part of the function will only run if the user fails to log in
        isSignInSuccessful = false
        UserDefaults.standard.setValue(isSignInSuccessful, forKey: "isLoggedIn")
        let alert = UIAlertController(
            title: "Incorrect email or password",
            message: "Please make sure that you have entered the details correctly.",
            preferredStyle: .alert)
        
        // When clicked, does nothing
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in }))
        
        self.present(alert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MainScreenViewController {
            // TODO: check user existence is storage
            vc.isLoggedIn = isSignInSuccessful
        }
    }
    
    // To dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
