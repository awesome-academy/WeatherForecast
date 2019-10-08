//
//  RainModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class RainModel: CoreObject {
    var threeHours: Double?
    
    init(data: [AnyHashable : Any]?) {
        threeHours = data?["3h"] as? Double
    }
}
