//
//  CurrentRouter.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class CurrentRouter: Router {

    func getCurrentWeather(param: CurrentWeatherParams) -> URLRequestConvertible {
        let path = buildValidFullPathForRequest(.currentWeather)
        return buildUrlRequest(Route(method: .get
                                     , path: path, queryParams: param.toJsonParam()))
    }
}
