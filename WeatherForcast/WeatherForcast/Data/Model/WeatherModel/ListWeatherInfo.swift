//
//  ListWeatherInfo.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

class ListWeatherInfo: CoreObject {

    var coordData: Coordinate?
    var mainData: MainTemperature?
    var weatherData = [Weather]()
    var cloudsData: Cloud?
    var windData: Wind?
    var sysData: Sys?

    required init(data: [AnyHashable: Any]?) {

        if let coordReceived = data?["coord"] as? [String: Any] {
            coordData = Coordinate(data: coordReceived)
        }
        if let mainReceived = data?["main"] as? [String: Any] {
            mainData = MainTemperature(data: mainReceived)
        }
        if let weatherReceived = data?["weather"] as? [[String: Any]] {
            weatherData = weatherReceived.map {
                Weather(data: $0)
            }
        }
        if let cloudReceived = data?["clouds"] as? [String: Any] {
            cloudsData = Cloud(data: cloudReceived)
        }
        if let windReceived = data?["wind"] as? [String: Any] {
            windData = Wind(data: windReceived)
        }
        if let sysReceived = data?["sys"] as? [String: Any] {
            sysData = Sys(data: sysReceived)
        }
    }
}
