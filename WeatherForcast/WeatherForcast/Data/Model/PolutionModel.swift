//
//  PolutionModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/3/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct PolutionModel: CoreObject {
    var precision = 0.0
    var pressure = 0
    var value = 0.0
    
    init(data: [AnyHashable : Any]?) {
        precision = data?["precision"] as? Float ?? 0.0
        pressure = data?["pressure"] as? Int ?? 0
        value = data?["value"] as? Float ?? 0.0
    }
}
