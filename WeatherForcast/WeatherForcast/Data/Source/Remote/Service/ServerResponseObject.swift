//
//  ServerResponseObject.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/1/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

class ServerResponseObject: CoreObject {
    var statusCode: Int?
    var statusMessage: String?
    var status: String?

    required init(data: [AnyHashable: Any]?) {
        statusCode = data?["cod"] as? Int
        statusMessage = data?["message"] as? String
        status = data?["status"] as? String
    }
}
