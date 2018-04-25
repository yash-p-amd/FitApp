//
//  InterfaceControllerProcessInput.swift
//  Assignment2 WatchKit Extension
//
//  Created by Yash Patel on 2018-04-24.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerProcessInput: WKInterfaceController {


    
    var PassDataObj = PassData()
    
    var gameTimer: Timer!
    
    var seconds : Double = 1.0

    var isStart : Bool = true
    var isPause : Bool = false
    
    @IBOutlet var start_pause: WKInterfaceButton!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        

        
        
        PassDataObj = context as! PassData
//        print(PassDataObj.buttonName)
//        print(PassDataObj.distance)
//        print(PassDataObj.distanceType)
//        print(PassDataObj.weigh)
//        print(PassDataObj.weighType)
        
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

    @IBOutlet var timer: WKInterfaceTimer!
    
    @IBAction func Start() {
        
        
        if isStart
        {

            timer.start()
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
            
            start_pause.setTitle("Pause")
            isStart = false
            isPause = true
        }
        else if isPause
        {
            timer.stop()
            gameTimer.invalidate()
            start_pause.setTitle("Start")
            isPause = false
            isStart = true
        }
        
    }
    
    @objc func runTimedCode()
    {
        self.seconds = self.seconds+1
        print(self.seconds)
    }
    
    @IBAction func Stop() {
        
        timer.stop()
        
        PassDataObj.time = self.seconds
        pushController(withName: "InterfaceControllerDisplayResult", context: PassDataObj)
        gameTimer.invalidate()


    }
    
    
}
