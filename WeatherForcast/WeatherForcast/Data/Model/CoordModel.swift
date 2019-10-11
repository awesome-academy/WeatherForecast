//
//  CoordModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct CoordModel: CoreObject {
    var lon = 0.0
    var lat = 0.0

    init(data: [AnyHashable: Any]?) {
        lat = data?["lat"] as? Double ?? 0.0
        lon = data?["lon"] as? Double ?? 0.0
    }
}
