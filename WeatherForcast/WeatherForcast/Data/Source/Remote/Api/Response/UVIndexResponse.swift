//
//  UVindexResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class UVIndexResponse: ServerResponseObject {
    var lat: Double?
    var lon: Double?
    var dateIso: String?
    var date: Int?
    var value: Double?
    
    required init(data: [AnyHashable : Any]?) {
        super.init(data: data)
        lat = data?["lat"] as? Double
        lon = data?["lon"] as? Double
        dateIso = data?["date_iso"] as? String
        date = data?["date"] as? Int
        value = data?["value"] as? Double

    }
}
