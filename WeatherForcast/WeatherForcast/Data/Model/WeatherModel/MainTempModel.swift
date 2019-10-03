//
//  MainTempModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class MainTempModel: CoreObject {
    var temp: Double
    var humidity: Int
    var tempMin: Double
    var tempMax: Double
    var pressure: Double
    var seaLevel: Double
    var tempKf: Double
    var grndLevel: Double
    
    init(data: [AnyHashable : Any]?) {
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

