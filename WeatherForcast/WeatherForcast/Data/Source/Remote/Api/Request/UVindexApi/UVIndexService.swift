//
//  UVindexService.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class UVIndexService {
    private let router = UVIndexRouter()
    
    func getUVData(param: UVIndexParams) -> ServiceRequest<UVIndexResponse> {
        let request = ServiceRequest<UVIndexResponse>()
        AlamofireAppmanager.shared.request(router.getUVdata(param: param)).responseJSON { (response: DataResponse<Any>) in
            request.handleResponseJSON(response: response)
        }
        return request
    }
}
