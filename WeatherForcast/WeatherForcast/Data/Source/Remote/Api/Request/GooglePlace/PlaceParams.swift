//
//  PlaceParams.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class PlaceParams: RequestParameterObject {
    var searchString: String?
    var key: String = kPlaceKey
    var language: String = "vi"
    var type: String = "cities"
    
    func toJsonParam() -> [String : Any] {
        var params = [String: Any]()
        if let temp = searchString {
            params["input"] = temp
        }
        params["key"] = key
        params["language"] = language
        params["types"] = type
        return params
    }
    

}
