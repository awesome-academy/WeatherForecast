//
//  UVIndexResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class UVIndexResponse: ServerResponseObject {
    var uvIndex: UVIndex?

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        uvIndex = UVIndex(data: data)
    }
}
