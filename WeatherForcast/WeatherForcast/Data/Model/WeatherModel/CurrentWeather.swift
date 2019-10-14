//
//  CurrentWeather.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class CurrentWeather: ListWeatherInfo {
    var base: String?
    var visibility: Int?
    var dateTimeCurrent: Int?
    var id: Int?
    var name: String?
    var timeZone: Int?

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        base = data?["base"] as? String
        visibility = data?["visibility"] as? Int
        dateTimeCurrent = data?["dt"] as? Int
        id = data?["id"] as? Int
        name = data?["name"] as? String
        timeZone = data?["timezone"] as? Int
    }
}
