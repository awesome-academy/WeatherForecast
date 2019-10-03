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
        if let loc = data?["location"] as? [String: Any] {
            location = CoordModel(data: loc)
        }
        if let d = data?["data"] as? [[String: Any]] {
            dataList = d.map({PolutionModel(data: $0)})
        }
    }
}

