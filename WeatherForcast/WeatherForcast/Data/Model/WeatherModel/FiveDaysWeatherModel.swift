//
//  FiveDaysWeatherModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class FiveDaysWeatherModel: ListWeatherModel {
    var rain: RainModel?
    var dt: Int?
    var dt_txt: Int?
    
    required init(data: [AnyHashable : Any]?) {
        super.init(data: data)
        if let r = data?["rain"] as? [String: Any] {
            rain = RainModel(data: r)
        }
        dt = data?["dt"] as? Int
        dt_txt = data?["dt_txt"] as? Int
    }
}
