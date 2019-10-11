//
//  UVIndexRouter.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class UVIndexRouter: Router {
    func getUVdata(param: UVIndexParams) -> URLRequestConvertible {
        let path = buildValidFullPathForRequest(.uvIndex)
        return buildUrlRequest(Route(method: .get, path: path, queryParams: param.toJsonParam()))
    }
}
