//
//  AirPolutionParams.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct AirPolutionParams: RequestParameterObject {
    var lat: Double? = 0.0
    var lon: Double? = 0.0

    func toJsonParam() -> [String: Any] {
        var params = [String: Any]()
        params["lat"] = lat ?? 0.0
        params["lon"] = lon ?? 0.0
        return params
    }
}
