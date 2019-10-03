//
//  AirPolutionRouter.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class AirPolutionRouter: Router {
    func getAirPolutionData(lat: Double,lon: Double) -> URLRequestConvertible {
        let str = "\(lat),\(lon)" + kAirPolution
        let path = buildValidFullPathForRequest(.airPolution) + str
        return buildUrlRequest(Route(method: .get, path: path))
    }
}
