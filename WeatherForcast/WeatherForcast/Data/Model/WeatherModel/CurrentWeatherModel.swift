//
//  CurrentWeatherModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class CurrentWeatherModel: ListWeatherModel {
    var base: String?
    var visibility: Int?
    var timeFromApi: Int?
    var id: Int?
    var name: String?
    var timeZone: Int?
    
    required init(data: [AnyHashable : Any]?) {
        super.init(data: data)
        base = data?["base"] as? String
        visibility = data?["visibility"] as? Int
        timeFromApi = data?["dt"] as? Int
        id = data?["id"] as? Int
        name = data?["name"] as? String
        timeZone = data?["timezone"] as? Int
                                                                                                            
    }
}
