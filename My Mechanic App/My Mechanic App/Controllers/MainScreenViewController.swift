import UIKit

class MainScreenViewController: UIViewController {
    
    var isLoggedIn: Bool = false
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        print(profilesData)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        print(isLoggedIn)
        if isLoggedIn {
            performSegue(withIdentifier: "showTabbarScreen", sender: self)
        } else {
            performSegue(withIdentifier: "showLoginInScreen", sender: self)
        }
    }
    
    @IBAction func unwindToMainScreen(_ unwindSegue: UIStoryboardSegue) {}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
