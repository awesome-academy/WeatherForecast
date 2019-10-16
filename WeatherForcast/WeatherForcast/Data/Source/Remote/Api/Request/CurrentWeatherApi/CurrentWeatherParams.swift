//
//  CurrentWeatherParams.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct CurrentWeatherParams: RequestParameterObject {
    var cityName: String? = ""
    var units = "metric"
    var lang = "vi"

    func toJsonParam() -> [String: Any] {
        var params = [String: Any]()
        params["q"] = cityName ?? ""
        params["units"] = units
        params["lang"] = lang
        return params
    }
}
