//
//  SysModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct SysModel: CoreObject {
    var pod: String
    var type: Int
    var id: Int
    var message: Double
    var country: String
    var sunRise: Int
    var sunSet: Int
    
    init(data: [AnyHashable : Any]?) {
        pod = data?["pod"] as? String ?? ""
        type = data?["type"] as? Int ?? 0
        id = data?["id"] as? Int ?? 0
        message = data?["message"] as? Double ?? 0.0
        country = data?["country"] as? String ?? ""
        sunRise = data?["sunrise"] as? Int ?? 0
        sunSet = data?["sunset"] as? Int ?? 0
    }
}

