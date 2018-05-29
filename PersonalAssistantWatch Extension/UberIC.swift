//
//  UberIC.swift
//  PersonalAssistantWatch Extension
//
//  Created by Raj  Chandan on 5/29/18.
//  Copyright © 2018 Final-Project. All rights reserved.
//

import WatchKit
import Foundation


class UberIC: WKInterfaceController {

    @IBOutlet var myMap: WKInterfaceMap!
    
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
    @IBAction func sendLocationtoPhone()
    {
    }
    
}
