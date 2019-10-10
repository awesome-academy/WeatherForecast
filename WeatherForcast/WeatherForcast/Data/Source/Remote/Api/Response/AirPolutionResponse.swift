//
//  AirPolutionResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class AirPolutionResponse: ServerResponseObject {
    required init(data: [AnyHashable : Any]?) {
        super.init(data: data)
    }
}
