//
//  AirPolutionResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class AirPolutionResponse: ServerResponseObject {
    var time: String?
    var location: CoordModel?
    var dataList = [PolutionModel]()
    
    required init(data: [AnyHashable : Any]?) {
        super.init(data: data)
        time = data?["time"] as? String
        if let locationData = data?["location"] as? [String: Any] {
            location = CoordModel(data: locationData)
        }
        if let dataReceived = data?["data"] as? [[String: Any]] {
            dataList = dataReceived.map {
                PolutionModel(data: $0)
            }
        }
    }
}

