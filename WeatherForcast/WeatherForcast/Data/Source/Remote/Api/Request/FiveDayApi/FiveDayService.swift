//
//  FiveDayService.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class FiveDayService {
    private let router = FiveDayRouter()

    func getFiveDayData(param: FiveDayParams) -> ServiceRequest<FiveDayResponse> {
        let request = ServiceRequest<FiveDayResponse>()
        AlamofireAppmanager.shared.request(router.getFiveDayData(param: param)).responseJSON { (response: DataResponse<Any>) in
            request.handleResponseJSON(response: response)
        }
        return request
    }
}
