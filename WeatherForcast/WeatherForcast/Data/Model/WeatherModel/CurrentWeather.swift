//
//  CurrentWeather.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Then

final class CurrentWeather: ListWeatherInfo, Then {
    var base = ""
    var visibility = 0
    var dateTimeCurrent = 0
    var id = 0
    var name = ""
    var timeZone = 0

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        base = data?["base"] as? String ?? ""
        visibility = data?["visibility"] as? Int ?? 0
        dateTimeCurrent = data?["dt"] as? Int ?? 0
        id = data?["id"] as? Int ?? 0
        name = data?["name"] as? String ?? ""
        timeZone = data?["timezone"] as? Int ?? 0
    }

}
