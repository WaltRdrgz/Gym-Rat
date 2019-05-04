import Foundation
import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var pushTextField: UITextField!
    @IBOutlet weak var pullTextField: UITextField!
    @IBOutlet weak var sitTextField: UITextField!
    @IBOutlet weak var mileTextField: UITextField!
    @IBOutlet weak var mileSecTextField: UITextField!
    
 
    
    var Push: Int?
    var Pull: Int?
    var Sit: Int?
    var Mile: Int?
    var MileS: Int?

    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(FirstViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        mileTextField.placeholder = "Min"
        mileSecTextField.placeholder = "Sec"
        img.image = UIImage(named: "workout")
        print("firstViewLoaded")
    }
    
    @objc func didTapView(){
        self.view.endEditing(true)
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let newPush = pushTextField.text{
            Push = Int(newPush)
        }
        if let newPull = pullTextField.text{
            Pull = Int(newPull)
        }
        if let newSit = sitTextField.text{
            Sit = Int(newSit)
        }
        if let newMile = mileTextField.text{
            Mile = Int(newMile)
        }
        if let newMileS = mileSecTextField.text{
            MileS = Int(newMileS)
        }
        
        
    }
    
}

