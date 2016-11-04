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

        let objectApi = WeatherForecast()
        
        //var testObject
        self.testFunc()
        
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
                
                objectApi.requstApi(json: json)

                let tempSt: String = String(format:"%.1f", objectApi.currentWearthrTemperature)
                self.tempLabel.text = "Temperature: " + tempSt + " C"
                
                let speedSt = String(format:"%.1f", objectApi.speedWind)
                self.dopLabel.text = "Wind speed: " + speedSt + " m"
                self.descriptionLabel.text = objectApi.nameСity + " " + objectApi.descriptionWearthr
                self.Image.af_setImage(withURL: NSURL(string:objectApi.iconStr) as! URL)

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
// MARK: - Update Model
extension CurrentViewController{
   
    func testFunc() {
         print ("open")
    }
}

