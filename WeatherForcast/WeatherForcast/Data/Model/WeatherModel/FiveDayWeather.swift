//
//  FiveDayWeather.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class FiveDayWeather: ListWeatherInfo {
    var rain: Rain?

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        if let rainReceived = data?["rain"] as? [String: Any] {
            rain = Rain(data: rainReceived)
        }
    }
}
