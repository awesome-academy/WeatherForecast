//
//  PlaceModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class PlaceModel: CoreObject {
    var description: String?
    
    init(data: [AnyHashable : Any]?) {
        description = data?["description"] as? String?
    }
}
