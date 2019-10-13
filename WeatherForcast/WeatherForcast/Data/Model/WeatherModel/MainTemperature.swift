//
//  MainTemperature.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct MainTemperature: CoreObject {
    var temp = 0.0
    var humidity = 0
    var tempMin = 0.0
    var tempMax = 0.0
    var pressure = 0.0
    var seaLevel = 0.0
    var tempKf = 0.0
    var grndLevel = 0.0

    init(data: [AnyHashable: Any]?) {
        temp = data?["temp"] as? Double ?? 0.0
        humidity = data?["humidity"] as? Int ?? 0
        tempMin = data?["temp_min"] as? Double ?? 0.0
        tempMax = data?["temp_max"] as? Double ?? 0.0
        pressure = data?["pressure"] as? Double ?? 0.0
        seaLevel = data?["sea_level"] as? Double ?? 0.0
        grndLevel = data?["grnd_level"] as? Double ?? 0.0
        tempKf = data?["temp_kf"] as? Double ?? 0.0
    }
}
