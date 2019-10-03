//
//  PlaceService.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class PlaceService {
    private let router = PlaceRouter()
    
    func getPlace(param: PlaceParams) -> ServiceRequest<PlaceResponse> {
        let request = ServiceRequest<PlaceResponse>()
        AlamofireAppmanager.shared.request(router.getPlace(param: param)).responseJSON { (response: DataResponse<Any>) in
            request.handleResponseJSON(response: response)
        }
        return request
    }
}
