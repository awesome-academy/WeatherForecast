//
//  UVIndexResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class UVIndexResponse: ServerResponseObject {
    var uvIndex = [UVIndex]()

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        if let dataReceived = data?[""] as? [[String: Any]] {
            uvIndex = dataReceived.map {
                UVIndex(data: $0)
            }
        }
    }
}
