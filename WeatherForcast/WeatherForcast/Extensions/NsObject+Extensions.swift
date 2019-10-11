//
//  NsObject+Extensions.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }
}
