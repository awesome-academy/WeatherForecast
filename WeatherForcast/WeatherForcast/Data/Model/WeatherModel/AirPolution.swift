//
//  AirPolution.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct AirPolution: CoreObject {
    var precision = 0.0
    var pressure = 0
    var value = 0.0

    init(data: [AnyHashable: Any]?) {
        precision = data?["precision"] as? Double ?? 0.0
        pressure = data?["pressure"] as? Int ?? 0
        value = data?["value"] as? Double ?? 0.0
    }
}
