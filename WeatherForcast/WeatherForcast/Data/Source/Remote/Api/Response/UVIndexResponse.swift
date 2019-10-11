//
//  UVIndexResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class UVIndexResponse: ServerResponseObject {
    var receivedData: UVModel?

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        receivedData = UVModel(data: data)
    }
}
