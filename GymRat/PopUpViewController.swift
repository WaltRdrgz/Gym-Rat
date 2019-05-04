
import UIKit

class PopUpViewController: UIViewController {
    
    
    @IBOutlet weak var pushLabel: UILabel!
    @IBOutlet weak var pullLabel: UILabel!
    @IBOutlet weak var sitLabel: UILabel!
    @IBOutlet weak var mileLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imgPush: UIImageView!
    @IBOutlet weak var imgPull: UIImageView!
    @IBOutlet weak var imgSit: UIImageView!
    @IBOutlet weak var imgMile: UIImageView!
    
    
    var recWorkout: Workout!
    var prevWorkout: Workout!
    
    let df = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        dump(recWorkout)
        dump(prevWorkout)
 
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.show()
    }
    
    
    func setup(){
        df.dateStyle = .medium
        df.timeStyle = .medium
        let item = recWorkout.date
        let dateString = df.string(from: item as Date)
        
        dateLabel.text = dateString
        pushLabel.text = "Push-Ups:  \(recWorkout.pushUps)"
        pullLabel.text = "Pull-Ups:  \(recWorkout.pullUps)"
        sitLabel.text = "Sit-Ups:  \(recWorkout.sitUps)"
        mileLabel.text = "Mile runtime:  \(recWorkout.mileRun):\(recWorkout.mileSec)"
        
        compare(a: recWorkout.pushUps, b: prevWorkout.pushUps, c: imgPush)
        compare(a: recWorkout.pullUps, b: prevWorkout.pullUps, c: imgPull)
        compare(a: recWorkout.sitUps, b: prevWorkout.sitUps, c: imgSit)
        
        let totalSecs = (recWorkout.mileRun * 60) + recWorkout.mileSec
        let prevSecs = (prevWorkout.mileRun * 60) + recWorkout.mileSec
        compare(a: totalSecs, b: prevSecs, c: imgMile)
        
        
    }
    
    func compare (a: Int, b: Int, c: UIImageView){
        if a > b{
            c.image = UIImage(named: "up")
        }
        else if a < b{
            c.image = UIImage(named: "down")
        }
        else {
            c.image = UIImage(named: "equal")
        }
    }
    

    
    
    
    @IBAction func ClosePopUp(_ sender: Any) {
        self.remove()
    }
    
    func show(){
        self.view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        });
    }
    
    func remove(){
        
        UIView.animate(withDuration: 0.25, animations: {
                self.view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.view.alpha = 0.0;
                
            }, completion:{(finished: Bool)  in
                if(finished){
                    self.view.removeFromSuperview()
                }
        });
    }
    

}
