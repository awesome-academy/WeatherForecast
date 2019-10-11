//
//  CurrentService.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class CurrentService {
    private let router = CurrentRouter()

    func getCurrentWeather(param: CurrentWeatherParams) -> ServiceRequest<CurrentWeatherResponse> {
        let request = ServiceRequest<CurrentWeatherResponse>()
        AlamofireAppmanager.shared.request(router.getCurrentWeather(param: param)).responseJSON { (response: DataResponse<Any>) in
            request.handleResponseJSON(response: response)
        }
        return request
    }
}
