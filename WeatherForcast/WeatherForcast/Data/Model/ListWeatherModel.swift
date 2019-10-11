//
//  ListWeatherModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/3/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

class ListWeatherModel: CoreObject {
    
    var coordData = [CoordModel]()
    var mainData = [MainTempModel]()
    var weatherData = [WeatherModel]()
    var cloudsData = [CloudModel]()
    var windData = [WindModel]()
    var sysData = [SysModel]()
    
    required init(data: [AnyHashable : Any]?) {
        if let dataReceived = data?["coord"] as? [[String: Any]] {
            coordData = dataReceived.map {
                CoordModel(data: $0)
            }
        }
        if let dataReceived = data?["main"] as? [[String: Any]] {
            mainData = dataReceived.map {
                MainTempModel(data: $0)
            }
        }
        if let dataReceived = data?["weather"] as? [[String: Any]] {
            weatherData = dataReceived.map {
                WeatherModel(data: $0)
            }
        }
        if let dataReceived = data?["clouds"] as? [[String: Any]] {
            cloudsData = dataReceived.map {
                CloudModel(data: $0)
            }
        }
        if let dataReceived = data?["wind"] as? [[String: Any]] {
            windData = dataReceived.map {
                WindModel(data: $0)
            }
        }
        if let dataReceived = data?["sys"] as? [[String: Any]] {
            sysData = dataReceived.map {
                SysModel(data: $0)
            }
        }
    }
}
