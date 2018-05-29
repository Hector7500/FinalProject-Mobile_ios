//
//  HomePageIC.swift
//  PersonalAssistantWatch Extension
//
//  Created by Raj  Chandan on 5/24/18.
//  Copyright © 2018 Final-Project. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import CoreLocation
import MapKit

class HomePageIC: WKInterfaceController, WCSessionDelegate, CLLocationManagerDelegate {

    @IBOutlet var hideBtn: WKInterfaceButton!
    @IBOutlet var loadingAnimation: WKInterfaceImage!
    
    var aResult : String?
    var session:WCSession!
    
    //Global Variable to acess request infor on each page
    static var requestinfo: String = ""
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        //Created Session to connect with the Phone
        if(WCSession.isSupported()){
            self.session = WCSession.default
            self.session.delegate = self
            self.session.activate()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func requestBtn()
    {
        let textChoices = ["What is the Weather","Play Despacito","Search for Game of Thrones"]
        presentTextInputController(withSuggestions: textChoices, allowedInputMode: WKTextInputMode.plain,
                                   completion: {(results) -> Void in if results != nil && results!.count > 0 { //selection made
                                    self.aResult = results?[0] as? String
                                    self.aResult = self.aResult!.lowercased()
                                    self.aResult = self.aResult!.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
                                    print(self.aResult!)
                                    //Send MEssage to Phone
                                    if(WCSession.isSupported())
                                    {
                                        self.hideBtn.setHidden(true)
                                        self.loadingAnimation.setHidden(false)
                                        self.loadingAnimation.setImageNamed("loading")
                                        self.loadingAnimation.startAnimatingWithImages(in: NSRange(location: 0, length: 137), duration: 12, repeatCount: Int.max)
                                        self.session.sendMessage(["Request": self.aResult!], replyHandler: nil, errorHandler: nil)
                                    }
                                    }
        }
        )
    }
    
    //function to receive the message from the Phone
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {

         HomePageIC.requestinfo = message["key"]! as! String
        print( HomePageIC.requestinfo)
        let keyofmsg =  HomePageIC.requestinfo.split(separator: ",")
        print(keyofmsg)
        if keyofmsg[0] != nil{
            switch(keyofmsg[0]){
            case "weather":
                pushController(withName: "WeatherIdentifier", context: nil)
                print("push")
                break
            case "google":
                break
                
            default:
                break
            }
        }
        loadingAnimation.setHidden(true)
        hideBtn.setHidden(false)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
}
