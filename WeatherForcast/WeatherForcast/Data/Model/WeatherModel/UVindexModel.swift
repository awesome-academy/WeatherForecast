//
//  UVindexModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct UVindexModel: CoreObject {
    var lat: Double
    var lon: Double
    var dateIso: String
    var date: Int
    var value: Double
    
    init(data: [AnyHashable : Any]?) {
        lat = data?["lat"] as? Double ?? 0.0
        lon = data?["lon"] as? Double ?? 0.0
        dateIso = data?["date_iso"] as? String ?? ""
        date = data?["date"] as? Int ?? 0
        value = data?["value"] as? Double ?? 0.0
    }
}
