//
//  City.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct City: CoreObject {
    var id = 0
    var name = ""
    var coord: Coordinate?
    var country = ""
    var population = 0
    var timeZone = 0
    var sunRise = 0
    var sunSet = 0

    init(data: [AnyHashable: Any]?) {
        id = data?["id"] as? Int ?? 0
        name = data?["name"] as? String ?? ""
        if let coordReceived = data?["coord"] as? [String: Any] {
            coord = Coordinate(data: coordReceived)
        }
        country = data?["country"] as? String ?? ""
        population = data?["population"] as? Int ?? 0
        timeZone = data?["timezone"] as? Int ?? 0
        sunRise = data?["sunrise"] as? Int ?? 0
        sunSet = data?["sunset"] as? Int ?? 0
    }
}

