//
//  UVIndexParams.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct UVIndexParams: RequestParameterObject {
    var coord: Coordinate?
    var cnt = 1

    func toJsonParam() -> [String: Any] {
        var params = [String: Any]()
        params["lat"] = coord?.lat ?? 0.0
        params["lon"] = coord?.lon ?? 0.0
        params["cnt"] = cnt
        return params
    }
}
