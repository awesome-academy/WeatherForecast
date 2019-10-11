//
//  AirPolutionService.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class AirPolutionService {
    private let router = AirPolutionRouter()

    func getAirPolutionData(lat: Double, lon: Double) -> ServiceRequest<AirPolutionResponse> {
        let request = ServiceRequest<AirPolutionResponse>()
        AlamofireAppmanager.shared.request(router.getAirPolutionData(lat: lat, lon: lon)).responseJSON { (response: DataResponse<Any>) in
            request.handleResponseJSON(response: response)
        }
        return request
    }
}
