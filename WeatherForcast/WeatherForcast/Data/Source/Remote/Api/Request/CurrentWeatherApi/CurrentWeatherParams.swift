//
//  CurrentWeatherParams.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct CurrentWeatherParams: RequestParameterObject {
    var cityName: String?
    var cityId: Int?
    
    func toJsonParam() -> [String : Any] {
        var params = [String: Any]()
        if let temp = cityName {
            params["q"] = temp
        }
        if let temp = cityId {
            params["id"] = temp
        }
        return params
    }
}
