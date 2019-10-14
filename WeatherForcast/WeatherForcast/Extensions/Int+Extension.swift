//
//  Int+Extension.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/14/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

extension Int {
    func getStringDateFromUnix() -> String {
        let myDouble = Double(self)
        let date = Date(timeIntervalSince1970: myDouble)
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        dateFormat.timeStyle = .short
        dateFormat.dateFormat = "MMM d, h:mm a"
        let stringDate = dateFormat.string(from: date)
        return stringDate
    }
}
