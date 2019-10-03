//
//  File.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct WeatherModel: CoreObject {
    var id = 0
    var main = ""
    var description = ""
    var icon = ""
    
    init(data: [AnyHashable : Any]?) {
        id = data?["id"] as? Int ?? 0
        main = data?["main"] as? String ?? ""
        description = data?["description"] as? String ?? ""
        icon = data?["icon"] as? String ?? ""
    }
}
