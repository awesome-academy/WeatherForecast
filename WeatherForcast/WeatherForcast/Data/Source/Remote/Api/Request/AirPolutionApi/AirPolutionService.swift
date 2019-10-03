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
    
    func getAirPolutionData(param: AirPolutionParams) -> ServiceRequest<AirPolutionResponse> {
        let request = ServiceRequest<AirPolutionResponse>()
        AlamofireAppmanager.shared.request(router.getAirPolutionData(param: param)).responseJSON { (response: DataResponse<Any>) in
            request.handleResponseJSON(response: response)
        }
        return request
    }
}
