//
//  PlaceRouter.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class PlaceRouter: Router {
    
    func getPlace(param: PlaceParams) -> URLRequestConvertible {
        let path = buildValidFullPathForRequest(.ggOutput)
        return buildUrlRequest(Route(method: .get, path: path, queryParams: param.toJsonParam()))
    }
}
