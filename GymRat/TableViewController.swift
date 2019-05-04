
import UIKit
import Foundation

class TableViewController: UITableViewController {
    
    var workoutSessions: [Workout] = []
    
    
    let df = DateFormatter()



    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print("tableViewLoaded")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return workoutSessions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        let item = workoutSessions[indexPath.row].date
        
        df.dateStyle = .medium
        df.timeStyle = .medium
        let dateString = df.string(from: item as Date)
        
        cell.textLabel?.text = dateString
        


        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpID") as! PopUpViewController
        
        let wrkout = workoutSessions[indexPath.row]
        
        var prevWrkout: Workout!
        
        if let _ = workoutSessions[exist: indexPath.row + 1]{
            prevWrkout = workoutSessions[indexPath.row + 1]
        }else{
            prevWrkout = Workout(pushUps: 0, pullUps: 0, sitUps: 0, mileRun: 0, mileSec: 0)
        }
        
        
        
        popUpVC.recWorkout = wrkout
        popUpVC.prevWorkout = prevWrkout
        
        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self)

    }
    


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            workoutSessions.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
  
    }


    
    // MARK: - Navigation
    
    
    @IBAction func unwindFromAdd(_ sender: UIStoryboardSegue){
        if sender.source is FirstViewController{
            if let senderVC = sender.source as? FirstViewController{
                
                let newWorkout = Workout(pushUps: senderVC.Push ?? 0,
                                         pullUps: senderVC.Pull ?? 0,
                                         sitUps: senderVC.Sit ?? 0,
                                         mileRun: senderVC.Mile ?? 0,
                                         mileSec: senderVC.MileS ?? 0)
                
                workoutSessions.insert(newWorkout, at: 0)
            }
            tableView.reloadData()
        }
    }
    
    
    @IBAction func unwindFromPopUp(unwindeSegue: UIStoryboardSegue){
        
    }
     
    


}
extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
