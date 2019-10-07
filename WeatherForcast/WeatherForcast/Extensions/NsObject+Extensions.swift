//
//  NsObject+Extensions.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

extension NSObject {
<<<<<<< HEAD
    var className: String {
        return String(describing: type(of: self))
    }

=======
    
    var className: String {
        return String(describing: type(of: self))
    }
    
>>>>>>> [task][18064]create_ui_search_screen
    class var className: String {
        return String(describing: self)
    }
}
