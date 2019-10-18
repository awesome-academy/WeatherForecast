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

    static var baseUrl = "https://api.openweathermap.org"
    static var googlePlaceUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/"

    func buildUrlRequest(_ route: Route) -> URLRequestConvertible {
        return RouterUrlConvertible(route: route)
    }

    func buildValidFullPathForRequest(_ path: PathURL) -> String {
        guard let url = URL(string: Router.baseUrl) else {
            return path.rawValue
        }
        return url.appendingPathComponent(path.rawValue).absoluteString
    }

    func builGoogleValidFullPathForRequest(_ path: PathURL) -> String {
        guard let url = URL(string: Router.googlePlaceUrl) else {
            return path.rawValue
        }
        return url.appendingPathComponent(path.rawValue).absoluteString
    }

    enum PathURL: String {
        case currentWeather = "/data/2.5/weather"
        case fiveDaysThreeHours = "/data/2.5/forecast"
        case uvIndex = "/data/2.5/uvi"
        case googleOutput = "json"
    }
}
