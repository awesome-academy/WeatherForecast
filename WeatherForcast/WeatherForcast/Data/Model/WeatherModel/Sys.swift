//
//  Sys.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct Sys: CoreObject {
    var pod = ""
    var type = 0
    var id = 0
    var message = 0.0
    var country = ""
    var sunRise = 0
    var sunSet = 0

    init(data: [AnyHashable: Any]?) {
        pod = data?["pod"] as? String ?? ""
        type = data?["type"] as? Int ?? 0
        id = data?["id"] as? Int ?? 0
        message = data?["message"] as? Double ?? 0.0
        country = data?["country"] as? String ?? ""
        sunRise = data?["sunrise"] as? Int ?? 0
        sunSet = data?["sunset"] as? Int ?? 0
    }
}
