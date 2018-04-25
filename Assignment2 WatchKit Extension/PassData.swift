//
//  PassData.swift
//  Assignment2 WatchKit Extension
//
//  Created by Yash Patel on 2018-04-24.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import Foundation

class PassData{
    
    var buttonName : String
    var weigh : Int
    var weighType : String
    var distance : Int
    var distanceType : String
    var time : Double
    init()
    {
        buttonName = ""
        weigh = 0
        weighType = ""
        distance = 0
        distanceType = ""
        time = 0.0
    }
}
