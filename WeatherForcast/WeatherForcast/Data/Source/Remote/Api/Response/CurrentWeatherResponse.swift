//
//  CurrentWeatherResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class CurrentWeatherResponse: ServerResponseObject {
    var listData: CurrentWeatherModel?
    var cod: Int?

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        cod = data?["cod"] as? Int
        if let coordReceived = data?["coord"] as? [String: Any] {
            listData?.coordData = CoordModel(data: coordReceived)
        }
        if let weatherReceived = data?["weather"] as? [String: Any] {
            listData?.weatherData = WeatherModel(data: weatherReceived)
        }
        if let mainReceived = data?["main"] as? [String: Any] {
            listData?.mainData = MainTempModel(data: mainReceived)
        }
        if let windReceived = data?["wind"] as? [String: Any] {
            listData?.windData = WindModel(data: windReceived)
        }
        if let cloudReceived = data?["clouds"] as? [String: Any] {
            listData?.cloudsData = CloudModel(data: cloudReceived)
        }
        if let sysReceived = data?["sys"] as? [String: Any] {
            listData?.sysData = SysModel(data: sysReceived)
        }
    }
}
