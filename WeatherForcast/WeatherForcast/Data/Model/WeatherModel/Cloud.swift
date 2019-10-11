//
//  Cloud.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct Cloud: CoreObject {
    var all = 0

    init(data: [AnyHashable: Any]?) {
        all = data?["all"] as? Int ?? 0
    }
}
