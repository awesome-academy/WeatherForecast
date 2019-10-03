//
//  FiveDayResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class FiveDayResponse: ServerResponseObject {
    var cod: String?
    var message: Double?
    var cnt: Int?
    var list = [FiveDaysWeatherModel]()
    var city: CityModel?
    
    required init(data: [AnyHashable : Any]?) {
        super.init(data: data)
        cod = data?["cod"] as? String
        message = data?["message"] as? Double
        cnt = data?["cnt"] as? Int
        if let d = data?["list"] as? [[String: Any]] {
            list = d.map {FiveDaysWeatherModel(data: $0)}
        }
        
        if let cityInfo = data?["city"] as? [String: Any] {
            city = CityModel(data: cityInfo)
        }
    }
}

