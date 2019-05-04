

import Foundation
import UIKit

class Workout: NSObject {
    let date: Date
    var pushUps: Int
    var pullUps: Int
    var sitUps: Int
    var mileRun: Int
    var mileSec: Int

    
    init(pushUps: Int, pullUps: Int, sitUps: Int, mileRun: Int, mileSec: Int) {
        self.pushUps = pushUps
        self.pullUps = pullUps
        self.sitUps = sitUps
        self.mileRun = mileRun
        self.mileSec = mileSec
        
        self.date = Date()
        
        
        super.init()
    }
    
}

