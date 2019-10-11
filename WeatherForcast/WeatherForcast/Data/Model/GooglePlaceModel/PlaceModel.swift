//
//  Place.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct Place: CoreObject {
    var description = ""

    init(data: [AnyHashable: Any]?) {
        description = data?["description"] as? String ?? ""
    }
}
