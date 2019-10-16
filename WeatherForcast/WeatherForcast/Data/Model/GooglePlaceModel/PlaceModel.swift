//
//  Place.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct Place: CoreObject {
    var description = ""
    var mainText = ""
    var secondaryText = ""

    init(data: [AnyHashable: Any]?) {
        description = data?["description"] as? String ?? ""
        if let data = data?["structured_formatting"] as? [String: Any] {
            mainText = data["main_text"] as? String ?? ""
            secondaryText = data["secondary_text"] as? String ?? ""
        }
    }
}
