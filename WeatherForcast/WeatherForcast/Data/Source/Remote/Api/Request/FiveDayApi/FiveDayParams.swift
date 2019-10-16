//
//  FiveDayParams.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct FiveDayParams: RequestParameterObject {
    var cityName: String? = ""
    var units = "metric"
    var lang = "vi"
    var cnt: Int? = 0
    
    func toJsonParam() -> [String: Any] {
        var params = [String: Any]()
        params["q"] = cityName ?? ""
        params["units"] = units
        params["lang"] = lang
        params["cnt"] = cnt ?? 0
        return params
    }
}
