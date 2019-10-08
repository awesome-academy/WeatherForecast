//
//  PlaceResponse.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class PlaceResponse: ServerResponseObject {
    var places = [PlaceModel]()
    
    required init(data: [AnyHashable : Any]?) {
        super.init(data: data)
        if let dt = data?["predictions"] as? [[String: Any]] {
            places = dt.map({PlaceModel(data: $0)})
        }
    }
}
