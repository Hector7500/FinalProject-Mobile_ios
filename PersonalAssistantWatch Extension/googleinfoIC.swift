//
//  googleinfoIC.swift
//  PersonalAssistantWatch Extension
//
//  Created by Raj  Chandan on 6/7/18.
//  Copyright © 2018 Final-Project. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class googleinfoIC: WKInterfaceController {

    @IBOutlet var googleInfoTitle: WKInterfaceLabel!
    @IBOutlet var googleInfoSnippet: WKInterfaceLabel!
    
    static var googleUrl : String = ""
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        if let googleData = context as? googleSearchInfo
        {
            googleInfoTitle.setText(googleData.title)
            googleInfoSnippet.setText(googleData.snippet)
            googleinfoIC.googleUrl = googleData.url
            print(googleinfoIC.googleUrl)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func readMoreBtn()
    {
        presentController(withName: "googleReadMoreIdentifier", context: nil)
    }
}
