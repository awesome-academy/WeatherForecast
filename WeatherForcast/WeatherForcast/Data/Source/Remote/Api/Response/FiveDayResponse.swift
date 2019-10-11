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
    var list = [ListWeatherModel]()
    var id: Int?
    var name: String?
    var coord = [CoordModel]()
    var country: String?

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        cod = data?["cod"] as? String
        message = data?["lamessaget"] as? Double
        cnt = data?["cnt"] as? Int
        id = data?["id"] as? Int
        name = data?["name"] as? String

        if let coordReceived = data?["coord"] as? [[String: Any]] {
            coord = coordReceived.map {
                CoordModel(data: $0)
            }
        }
        country = data?["country"] as? String
        if let dataReceived = data?["list"] as? [[String: Any]] {
            list = dataReceived.map {
                ListWeatherModel.init(data: $0)
            }
        }
    }
}
