//
//  FiveDayRouter.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class FiveDayRouter: Router {
    
    func getFiveDayData(param: FiveDayParams) -> URLRequestConvertible {
        let path = buildValidFullPathForRequest(.fiveDaysThreeHours)
        return buildUrlRequest(Route.init(method: .get, path: path, queryParams: param.toJsonParam()))
    }
}
