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
    func getAirPolutionData(param: AirPolutionParams) -> URLRequestConvertible {
        let path = buildValidFullPathForRequest(.airPolution)
        return buildUrlRequest(Route(method: .get
            , path: path, queryParams: param.toJsonParam()))
    }
}
