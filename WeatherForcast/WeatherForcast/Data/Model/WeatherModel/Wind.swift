//
//  Wind.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct Wind: CoreObject {
    var speed = 0.0
    var deg = 0

    init(data: [AnyHashable: Any]?) {
        speed = data?["speed"] as? Double ?? 0.0
        deg = data?["deg"] as? Int ?? 0
    }
}
