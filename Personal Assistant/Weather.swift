//
//  Weather.swift
//  Personal Assistant
//
//  Created by Hector Kesar on 4/11/18.
//  Copyright © 2018 Final-Project. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import SwiftyJSON

class Weather: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var weathertable: UITableView!
    @IBOutlet weak var Searchweathertext: UITextField!
    
    struct weatherinfo{
        var Location : String
        var forcast : String
        var image : String
        var rain : String
        var templow : String
        var temphigh : String
        var humidty : String
        var date: String
    }
    
    var weatherforcasts:[weatherinfo] = []
    
    let locationManager:CLLocationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var city: String?
    var state: String?
    var stringtoserver:String?
    var activityindactor:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        weathertable.delegate = self
        weathertable.dataSource = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Weather.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        //locationManager.stopUpdatingLocation()
        self.FetchPreviousCall()
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func SearchForWeather(_ sender: UIButton) {
        if Searchweathertext.text != "" && Searchweathertext.text != " "{
            activityindactor.center = self.view.center
            activityindactor.hidesWhenStopped = true
            activityindactor.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
            view.addSubview(activityindactor)
            activityindactor.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            let server = Servercalls()
            var servermetod = "whats the weather in " + Searchweathertext.text!.lowercased()
            servermetod = servermetod.trimmingCharacters(in: .whitespacesAndNewlines)
            servermetod = servermetod.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
            server.apicall(city: city!, state: state!, voicecall: servermetod)
            print(Servercalls.serverjson)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7), execute: {
              
            UIApplication.shared.endIgnoringInteractionEvents()
            self.activityindactor.removeFromSuperview()
            print(Servercalls.serverjson)
            self.FetchPreviousCall()
            self.weathertable.reloadData()
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherforcasts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wcell = weathertable.dequeueReusableCell(withIdentifier: "weathercustomcell") as! WeatherTableViewCell
        
        wcell.weatherforcast.text = weatherforcasts[indexPath.row].forcast
        wcell.weatherrain.text =  weatherforcasts[indexPath.row].rain
        wcell.weatherhumidty.text =  weatherforcasts[indexPath.row].humidty
        wcell.weathertemplow.text =  weatherforcasts[indexPath.row].templow
        wcell.weathertemphigh.text =  weatherforcasts[indexPath.row].temphigh
        wcell.weatherlocation.text =  weatherforcasts[indexPath.row].Location
        wcell.Weatherdayoftheyear.text = weatherforcasts[indexPath.row].date
        let imageUrl:URL = URL(string: weatherforcasts[indexPath.row].image)!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        wcell.weatherimage.image = UIImage(data: imageData as Data)
        wcell.weatherimage.contentMode = UIViewContentMode.scaleAspectFit
        return wcell
    }
    
    func FetchPreviousCall(){
    if Servercalls.serverjson["key"].string != nil && Servercalls.serverjson["key"].string == "weather" {
        weatherforcasts.removeAll()
        
        var index:Int = 0
        while true {
            
            if  Servercalls.serverjson["city"].string != nil && Servercalls.serverjson["state"].string != nil && Servercalls.serverjson["results"][index]["condition"].string != nil && Servercalls.serverjson["results"][index]["url"].string != nil && Servercalls.serverjson["results"][index]["precip"].double != nil && Servercalls.serverjson["results"][index]["temp_lowf"].string != nil && Servercalls.serverjson["results"][index]["temp_highf"].string != nil && Servercalls.serverjson["results"][index]["humidity"].double != nil && Servercalls.serverjson["results"][index]["month"].int != nil &&  Servercalls.serverjson["results"][index]["day"].int != nil && Servercalls.serverjson["results"][index]["year"].int != nil {
                
                       weatherforcasts.append(weatherinfo(Location: Servercalls.serverjson["city"].string! + ", " + Servercalls.serverjson["state"].string!,forcast: "Forcast: " + Servercalls.serverjson["results"][index]["condition"].string!,image:  Servercalls.serverjson["results"][index]["url"].string!,rain: "Rain: " + String(Servercalls.serverjson["results"][index]["precip"].double!) + "%", templow: "Low: " + Servercalls.serverjson["results"][index]["temp_lowf"].string! + "°F", temphigh: "High: " + Servercalls.serverjson["results"][index]["temp_highf"].string! + "°F",humidty: "Humidity: " + String(Servercalls.serverjson["results"][index]["humidity"].double!), date: String(Servercalls.serverjson["results"][index]["month"].int!) + "/" + String(Servercalls.serverjson["results"][index]["day"].int!) + "/" + String(Servercalls.serverjson["results"][index]["year"].int!)))
            }else{
                break
            }
            index += 1
        }
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
    
}
