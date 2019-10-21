//
//  PlaceParams.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct PlaceParams: RequestParameterObject {
    var searchString: String? = ""
    var key: String = kPlaceKey
    var language = "vi"

    func toJsonParam() -> [String: Any] {
        var params = [String: Any]()
        params["input"] = searchString ?? ""
        params["key"] = key
        params["language"] = language
        return params
    }
}
