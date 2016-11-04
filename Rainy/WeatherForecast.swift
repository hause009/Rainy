//
//  WeatherForecast.swift
//  Rainy
//
//  Created by Alex on 17.10.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherForecast
    
{
    var currentWearthrTemperature: Double = 0.0
    var speedWind: Double = 0.0
    var iconStr:String = ""
    var nameСity:String = ""
    var descriptionWearthr:String = ""
    
    
    func requstApi (json:JSON) {
        //let json = JSON(value)
        print("JSON=: \(json)")
        
        let temp = json["main"]["temp"].doubleValue
        currentWearthrTemperature = temp - 273.15
        print("currentWearthrTemperature=: \(currentWearthrTemperature)")
    
        speedWind = json["wind"]["speed"].doubleValue
        print ("speedWind: \(speedWind)")
        
        let humidity = json["main"]["humidity"].stringValue
        print ("--------------: \(humidity)")
        
        //let description
        let list: Array<JSON> = json["weather"].arrayValue
        print ("--------------: \(list[0])")
        let weather = list[0].dictionary!
        print ("--------------: \(weather)")
        
        descriptionWearthr = (weather["description"]?.stringValue)!
        nameСity = json["name"].stringValue
        //self.descriptionLabel.text = name + " " + description!
        print ("description= \(nameСity)")
        
        let icon = weather["icon"]?.stringValue
        iconStr = "http://openweathermap.org/img/w/" + icon! + ".png"
        //http://openweathermap.org/img/w/10d.png
        print ("icon= \(iconStr)")//.png
        
        
    }
    
    func test() {
        print("test")
    }
}
