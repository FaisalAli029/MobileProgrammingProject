import UIKit

class MyCarViewCarDetailsViewController: UIViewController {
    
    // The car details that has been passed
    var carDetails: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // To test if data is passed correctly
        // ======
        print("")
        print("Manufacturer: \(carDetails!.manufacturer)")
        print("Model: \(carDetails!.model)")
        print("Year Manufactured: \(carDetails!.yearManufactured)")
        print("Engine: \(carDetails!.engine)")
        print("License Plate: \(carDetails!.licensePlate)")
        print("Mileage: \(carDetails!.mileage)")
        print("Car Price: \(carDetails!.cost)")
        //print("Services List: \(carDetails!.servicesList)")
        print("")
        // === END OF TESTING ===
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showServices" {
            if let vc = segue.destination as? ServicesMainScreenViewController {
                vc.servicesList = carDetails!.servicesList
            }
        }
    }
    
    // Redirects to the 'Services' screen when the button is clicked
    @IBAction func viewServicesBtnClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showServices", sender: self)
    }
}
