//
//  Date+Extension.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/20/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

extension Date {

    static var yesterday: Date {
        return Date().dayBefore
    }
    
    static var tomorrow: Date {
        return Date().dayAfter
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon) ?? Date()
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon) ?? Date()
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }

    func getCurrentDateString() -> String {
        let dateFormat = DateFormatter().then {
            $0.dateStyle = .short
            $0.timeStyle = .short
            $0.dateFormat = "MM/dd"
        }
        let stringDate = dateFormat.string(from: self)
        return stringDate
    }
}
