//
//  WeatherForecast.swift
//  Rainy
//
//  Created by Alex on 17.10.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import Foundation

class WeatherForecast
{
    let currentWearthrTemperature: Double?
    let rainProbability: Double?
    //let rime

    init(currentWearthrTemperature: Double?, rainProbability: Double?) {
        self.currentWearthrTemperature = currentWearthrTemperature
        self.rainProbability = rainProbability
    }

}
