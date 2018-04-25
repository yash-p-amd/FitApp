//
//  InterfaceControllerDisplayResult.swift
//  Assignment2 WatchKit Extension
//
//  Created by Yash Patel on 2018-04-24.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class InterfaceControllerDisplayResult: WKInterfaceController {

    @IBOutlet var ResultRing: WKInterfaceActivityRing!
    @IBOutlet var DisplayBunredCals: WKInterfaceLabel!
    
    var PassDataObj = PassData()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        PassDataObj = context as! PassData
        
        var ex_tpe : Double = 0.0
        //Manage Type
        if PassDataObj.buttonName == "Walking"
        {
            ex_tpe = 0.029
        }
        else if PassDataObj.buttonName == "Running"
        {
            ex_tpe = 0.058
        }
        else if PassDataObj.buttonName == "Cycling"
        {
            ex_tpe = 1.560
        }
        
        
        var ex_weight : Double = 0.0
        //Manage Weight Factors
        if PassDataObj.weighType == "Kg"
        {
            ex_weight = Double(PassDataObj.weigh)
        }
        else if PassDataObj.weighType == "Lb"
        {
            ex_weight = Double(PassDataObj.weigh) * 2.2
        }
        
        var ex_distance : Double = 0.0
        //Manage DistanceFactor
        if PassDataObj.distanceType == "Km"
        {
            ex_distance = Double(PassDataObj.distance)
        }
        else if PassDataObj.distanceType == "Mile"
        {
            ex_distance = Double(PassDataObj.distance) * 1.6
        }
    
        let burnedCal = ex_tpe * ex_weight * ex_distance * (PassDataObj.time * 0.0166667)
        
        print(burnedCal)
        
        
        DisplayBunredCals.setText(String(burnedCal))
        let summary = HKActivitySummary()
        let value: Double = burnedCal/100
        let goal: Double = 100
        
        summary.activeEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: value)
        summary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: goal)
        
        summary.appleExerciseTime = HKQuantity(unit: HKUnit.minute(), doubleValue: value)
        summary.appleExerciseTimeGoal = HKQuantity(unit: HKUnit.minute(), doubleValue: goal)
        
        summary.appleStandHours = HKQuantity(unit: HKUnit.count(), doubleValue: value)
        summary.appleStandHoursGoal = HKQuantity(unit: HKUnit.count(), doubleValue: goal)
        
        ResultRing.setActivitySummary(summary, animated: true)
        
        print(PassDataObj.buttonName)
        
        // Configure interface objects here.
    }


    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
