//
//  File.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class CityModel: CoreObject {
    
    var id: Int?
    var name: String?
    var coord: CoordModel?
    var country: String?
    var population: Int?
    var timeZone: Int?
    var sunRise: Int?
    var sunSet: Int?
    
    init(data: [AnyHashable : Any]?) {
        id = data?["id"] as? Int
        name = data?["name"] as? String
        if let c = data?["coord"] as? [String: Any] {
            coord = CoordModel(data: c)
        }
        country = data?["country"] as? String
        population = data?["population"] as? Int
        timeZone = data?["timezone"] as? Int
        sunRise = data?["sunrise"] as? Int
        sunSet = data?["sunset"] as? Int
    }
}
