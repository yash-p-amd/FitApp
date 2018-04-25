//
//  InterfaceControllerUserInput.swift
//  Assignment2 WatchKit Extension
//
//  Created by Yash Patel on 2018-04-24.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerUserInput: WKInterfaceController {

    @IBOutlet var weigInput: WKInterfacePicker!
    @IBOutlet var weighOptions: WKInterfacePicker!
    
    @IBOutlet var distanceInput: WKInterfacePicker!
    @IBOutlet var distanceOptions: WKInterfacePicker!
    
    var PassDataObj = PassData()
    
    var weigh_distance_Options:[(Int, String)] = []
    var weigh_Options:[(String,String)] = [
        ("Kg","Kg / Lb"),
        ("Lb","Kg / Lb")]
    
    var distance_Options:[(String,String)] = [
        ("Km","Km / Mile"),
        ("Mile","Km / Mile")]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        for i in 1...200 {
            weigh_distance_Options.append((i,"1-200"))
        }
        
        let pickerItems0: [WKPickerItem] = weigh_distance_Options.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = String($0.0)
            pickerItem.caption = $0.1
            return pickerItem
        }
        weigInput.setItems(pickerItems0)
        distanceInput.setItems(pickerItems0)
        
        let pickerItems1: [WKPickerItem] = weigh_Options.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.1
            return pickerItem
        }
        weighOptions.setItems(pickerItems1)
        
        let pickerItems2: [WKPickerItem] = distance_Options.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.1
            return pickerItem
        }
        distanceOptions.setItems(pickerItems2)
        
        PassDataObj = context as! PassData
        
//        if PassDataObj = context as? PassData
//        {
//            print(PassDataObj.buttonName)
//        }
        
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
    
    
    @IBAction func weigInput_Action(_ value: Int) {
        
        PassDataObj.weigh = weigh_distance_Options[value].0
        
    }
    
    @IBAction func weighOptions_Action(_ value: Int) {
        
        PassDataObj.weighType = weigh_Options[value].0
        
    }
    
    
    @IBAction func distanceInput_Action(_ value: Int) {
        
        PassDataObj.distance = weigh_distance_Options[value].0
        
    }
    
    @IBAction func distanceOptions_Action(_ value: Int) {
        
        PassDataObj.distanceType = distance_Options[value].0
    }
    
    
    @IBAction func Go() {
        
        
        pushController(withName: "InterfaceControllerProcessInput", context: PassDataObj)
        
        
    }
    
}
