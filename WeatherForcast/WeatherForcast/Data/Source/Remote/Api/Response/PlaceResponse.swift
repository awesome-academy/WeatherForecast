//
//  PlaceResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class PlaceResponse: ServerResponseObject {
    var places = [Place]()

    required init(data: [AnyHashable: Any]?) {
        super.init(data: data)
        if let placeReceived = data?["predictions"] as? [[String: Any]] {
            places = placeReceived.map {
                Place(data: $0)
            }
        }
    }
}
