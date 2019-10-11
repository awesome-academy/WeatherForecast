//
//  Rain.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct Rain: CoreObject {
    var rainCount = 0.0

    init(data: [AnyHashable: Any]?) {
        rainCount = data?["3h"] as? Double ?? 0.0
    }
}
