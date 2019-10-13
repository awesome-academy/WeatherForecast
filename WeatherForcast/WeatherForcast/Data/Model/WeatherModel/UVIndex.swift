//
//  UVIndex.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct UVIndex: CoreObject {
    var lat = 0.0
    var lon = 0.0
    var dateIso = ""
    var date = 0
    var value = 0.0

    init(data: [AnyHashable: Any]?) {
        lat = data?["lat"] as? Double ?? 0.0
        lon = data?["lon"] as? Double ?? 0.0
        dateIso = data?["date_iso"] as? String ?? ""
        date = data?["date"] as? Int ?? 0
        value = data?["value"] as? Double ?? 0.0
    }
}
