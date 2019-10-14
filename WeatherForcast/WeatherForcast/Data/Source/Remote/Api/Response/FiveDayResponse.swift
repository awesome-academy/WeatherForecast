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
    var listData = [FiveDayWeather]()
    var city: City?

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        cod = data?["cod"] as? String ?? ""
        message = data?["message"] as? Double ?? 0.0
        cnt = data?["cnt"] as? Int ?? 0
        if let listReceived = data?["list"] as? [[String: Any]] {
            listData = listReceived.map {
                FiveDayWeather.init(data: $0)
            }
        }
        if let cityInfo = data?["city"] as? [String: Any] {
            city = City(data: cityInfo)
        }
    }
}

