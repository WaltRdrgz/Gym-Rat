
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imgHome: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgHome.image = UIImage(named: "gymRat.jpeg")

    }
    



}
