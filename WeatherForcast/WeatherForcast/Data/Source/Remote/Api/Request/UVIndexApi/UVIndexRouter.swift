//
//  UVindexRouter.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class UVindexRouter: Router {
    func getUVdata(param: UVindexParams) -> URLRequestConvertible {
        let path = buildValidFullPathForRequest(.uvIndex)
        return buildUrlRequest(Route(method: .get, path: path, queryParams: param.toJsonParam()))
    }
}
