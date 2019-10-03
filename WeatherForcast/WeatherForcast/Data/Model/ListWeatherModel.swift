//
//  ListWeatherModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/3/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class ListWeatherModel: CoreObject {
    
    var coordDt = [CoordModel]()
    var mainDt = [MainTempModel]()
    var weatherDt = [WeatherModel]()
    var cloudsDt = [CloudModel]()
    var windDt = [WindModel]()
    var sysDt = [SysModel]()
    
    init(data: [AnyHashable : Any]?) {
        if let d = data?["coord"] as? [[String: Any]] {
            coordDt = d.map({CoordModel(data: $0)})
        }
        if let d = data?["main"] as? [[String: Any]] {
            mainDt = d.map({MainTempModel(data: $0)})
        }
        if let d = data?["weather"] as? [[String: Any]] {
            weatherDt = d.map({WeatherModel(data: $0)})
        }
        if let d = data?["clouds"] as? [[String: Any]] {
            cloudsDt = d.map({CloudModel(data: $0)})
        }
        if let d = data?["wind"] as? [[String: Any]] {
            windDt = d.map({WindModel(data: $0)})
        }
        if let d = data?["sys"] as? [[String: Any]] {
            sysDt = d.map({SysModel(data: $0)})
        }
        
        
    }
}


