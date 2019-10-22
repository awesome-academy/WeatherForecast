//
//  Coordinate.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Then

struct Coordinate: CoreObject, Then {
    var lon = 0.0
    var lat = 0.0

    init(data: [AnyHashable: Any]?) {
        lat = data?["lat"] as? Double ?? 0.0
        lon = data?["lon"] as? Double ?? 0.0
    }
}
