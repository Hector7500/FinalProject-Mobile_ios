//
//  Youtube.swift
//  Personal Assistant
//
//  Created by Hector Kesar on 4/18/18.
//  Copyright © 2018 Final-Project. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation
import CoreLocation
import Speech
import SwiftyJSON
class Youtube: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate, CLLocationManagerDelegate, SFSpeechRecognizerDelegate {

    @IBOutlet weak var Titleofvideo: UILabel!
    @IBOutlet weak var Searchfortext: UITextField!
    
    
    @IBOutlet weak var youtubeview: WKWebView!
    var audioRecorder: AVAudioRecorder!
    var player : AVAudioPlayer?
    var isRecording = false
    let locationManager:CLLocationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var city: String?
    var state: String?
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()
    var stringtoserver: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.FetchPreviousCall()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func setvideo (videoid:String, videotitle:String){
        let url = URL(string: "https://www.youtube.com/embed/\(videoid)")
        youtubeview.load(URLRequest(url: url!))
        Titleofvideo.text = videotitle
    }
    
    
    @IBAction func voicebuttonpressed(_ sender: UIButton) {
    
    }
    
    @IBAction func Searchfortextyoutube(_ sender: UIButton) {
        if Searchfortext.text != "" && Searchfortext.text != " "{
        let server = Servercalls()
        var servermetod = "play " + Searchfortext.text!
        servermetod = servermetod.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
        server.apicall(city: city!, state: state!, voicecall: servermetod)
        print(Servercalls.serverjson)
        sleep(5)
        print(Servercalls.serverjson)
        setvideo(videoid: Servercalls.serverjson["id"].string!, videotitle: Servercalls.serverjson["title"].string!)
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var location = locations[0]
        
        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            // always good to check if no error
            // also we have to unwrap the placemark because it's optional
            // I have done all in a single if but you check them separately
            if error == nil, let placemark = placemarks, !placemark.isEmpty {
                self.placemark = placemark.last
            }
            // a new function where you start to parse placemarks to get the information you need
            // here we check if location manager is not nil using a _ wild card
            if let _:CLLocation = location {
                // unwrap the placemark
                if let placemark = self.placemark {
                    // wow now you can get the city name. remember that apple refers to city name as locality not city
                    // again we have to unwrap the locality remember optionalllls also some times there is no text so we check that it should not be empty
                    if let city = placemark.locality, !city.isEmpty {
                        // here you have the city name
                        // assign city name to our iVar
                        self.city = city
                    }
                    // the same story optionalllls also they are not empty
                    if let state = placemark.administrativeArea, !state.isEmpty {
                        
                        self.state = state
                    }
                }
                self.city = self.city!.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
                print(self.city)
                print(self.state)
                
            } else {
                // add some more check's if for some reason location manager is nil
            }
        })
    }
    
    func FetchPreviousCall(){
        if Servercalls.serverjson["key"].string != nil && Servercalls.serverjson["key"] == "youtube" {
            setvideo(videoid: Servercalls.serverjson["id"].string!, videotitle: Servercalls.serverjson["title"].string!)
        }
    }
   
}
    



