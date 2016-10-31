//
//  FirstViewController.swift
//  Rainy
//
//  Created by Alex on 17.10.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation
import AlamofireImage
//import Contacts

class CurrentViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dopLabel: UILabel!
    
    
    @IBAction func updateAction(_ sender: AnyObject) {
        
    }
    
    var manager:CLLocationManager!
    var locCoord : CLLocationCoordinate2D!
    var latitude = 0.0000
    var longitude = 0.000
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()

       
        let headers = [
            "X-API-KEY": Constants.apiKey,
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        //Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139", headers: headers).responseJSON { response in
        let strLatitude:String = String (latitude)
        let strLongitude:String = String (longitude)
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(strLatitude)&lon=\(strLongitude)", headers: headers).responseJSON { response in
         
//            if let JSON = response.result.value {
//                //print("JSON: \(JSON)")
//            }
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON=: \(json)")

                var temp = json["main"]["temp"].doubleValue
                temp = temp - 273.15
                let tempSt: String = String(format:"%.1f", temp)
                self.tempLabel.text = "Temperature: " + tempSt + " C"
                
                print ("--------------: \(temp)")
                
                let speed = json["wind"]["speed"].doubleValue
                let speedSt = String(format:"%.1f", speed)
                //self.dopLabel.text = String(format:"%.1f", speed)
                self.dopLabel.text = "Wind speed: " + speedSt + " m"
                print ("--------------: \(speed)")
                
                
                let humidity = json["main"]["humidity"].stringValue
                print ("--------------: \(humidity)")
                
                //let description
                let list: Array<JSON> = json["weather"].arrayValue
                print ("--------------: \(list[0])")
                let weather = list[0].dictionary!
                print ("--------------: \(weather)")
                
                let description = weather["description"]?.stringValue
                let name : String = json["name"].stringValue
                self.descriptionLabel.text = name + " " + description!
                print ("description= \(description)")
                
                var icon = weather["icon"]?.stringValue
                icon = "http://openweathermap.org/img/w/" + icon! + ".png"
                //http://openweathermap.org/img/w/10d.png
                //let downloadURL = NSURL(string:
                self.Image.af_setImage(withURL: NSURL(string:icon!) as! URL)
                print ("icon= \(icon)")//.png
                
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        //locCoord = locValue
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        latitude = locValue.latitude
        longitude = locValue.longitude
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


