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

    func toJsonParam() -> [String: Any] {
        var params = [String: Any]()
<<<<<<< HEAD
        params["q"] = cityName ?? ""
=======
        if let temp = cityName {
            params["q"] = temp
        }
        if let temp = cityId {
            params["id"] = temp
        }
>>>>>>> [task][18064]create_ui_search_screen
        return params
    }
}
