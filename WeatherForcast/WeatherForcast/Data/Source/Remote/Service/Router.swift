//
//  Router.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/1/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

class Router {
    
    static var baseUrl = "api.openweathermap.org"
    
    func buildUrlRequest(_ route: Route) -> URLRequestConvertible {
        return RouterUrlConvertible(route: route)
    }
    
    func buildValidFullPathForRequest(_ path: PathURL) -> String {
        if let url = URL(string: Router.baseUrl) {
            return url.appendingPathComponent(path.rawValue).absoluteString
        }
        return path.rawValue // the value never jump in, dont need to care about
    }
    
    //
    enum PathURL: String {
        case sixTeenDays = "/data/2.5/forecast/daily?" //param: key, city name ( q), city id( id ),
        case currentWeather = "/data/2.5/weather?" //param: key, city name (q), city id ( id )
        case fiveDaysThreeHours = "/data/2.5/forecast?" // param: city name (q), city id (id)
        case uvIndex = "/data/2.5/uvi?"// param: lat , long
        case airPolutionHead = "/pollution/v1/co/" //param: lat, long
        case airPolutionTail = "/current.json?" //param: key
    }
}
