//
//  UVindexParams.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct UVindexParams: RequestParameterObject {
    var lat: Double?
    var lon: Double?

    func toJsonParam() -> [String : Any] {
        var params = [String: Any]()
        if let temp = lat {
            params["lat"] = temp
        }
        if let temp = lon {
            params["lon"] = temp
        }
        return params
    }
}
