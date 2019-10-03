//
//  CurrentWeatherResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class CurrentWeatherResponse: ServerResponseObject {
    var listData: ListWeatherModel?
    var base: String?
    var visibility: Int?
    var dt: Int?
    var id: Int?
    var name: String?
    var cod: Int?

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        if let coordReceived = data?["coord"] as? [[String: Any]] {
            listData?.coordData = coordReceived.map {
                CoordModel(data: $0)
            }
        }
        if let weatherReceived = data?["weather"] as? [[String: Any]] {
            listData?.weatherData = weatherReceived.map {
                WeatherModel(data: $0)
            }
        }
        if let mainReceived = data?["main"] as? [[String: Any]] {
            listData?.mainData = mainReceived.map {
                MainTempModel(data: $0)
            }
        }
        if let windReceived = data?["wind"] as? [[String: Any]] {
            listData?.windData = windReceived.map {
                WindModel(data: $0)
            }
        }
        if let cloudReceived = data?["clouds"] as? [[String: Any]] {
            listData?.cloudsData = cloudReceived.map {
                CloudModel(data: $0)
            }
        }
        if let sysReceived = data?["sys"] as? [[String: Any]] {
            listData?.sysData = sysReceived.map {
                SysModel(data: $0)
            }
        }
        base = data?["base"] as? String
        visibility = data?["visibility"] as? Int
        dt = data?["dt"] as? Int
        id = data?["id"] as? Int
        name = data?["name"] as? String
        cod = data?["cod"] as? Int
<<<<<<< HEAD
=======
        
        
        
>>>>>>> [normal][18031]create request
    }
}
