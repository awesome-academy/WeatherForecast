//
//  CloudModel.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct CloudModel: CoreObject {
    var all: Int
    
    init(data: [AnyHashable : Any]?) {
        all = data?["all"] as? Int ?? 0
    }
}
