//
//  InterfaceController.swift
//  Assignment2 WatchKit Extension
//
//  Created by Yash Patel on 2018-04-24.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {


    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
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
    

    @IBAction func Walking() {
        let PassDataObj = PassData()
        PassDataObj.buttonName = "Walking"
        pushController(withName: "InterfaceControllerUserInput", context: PassDataObj)
    }
    
    @IBAction func Running() {
        let PassDataObj = PassData()
        PassDataObj.buttonName = "Running"
        pushController(withName: "InterfaceControllerUserInput", context: PassDataObj)
    }
    
    @IBAction func Cycling() {
        let PassDataObj = PassData()
        PassDataObj.buttonName = "Cycling"
        pushController(withName: "InterfaceControllerUserInput", context: PassDataObj)
    }
    
    //    var currentValue: AnyObject = "0" as AnyObject
    //
//    override func contextsForSegue(withIdentifier segueIdentifier: String) -> [Any]? {
//        return self.currentValue as! [Any]
//    }


}
