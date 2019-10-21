//
//  RealmWeather.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/22/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWeather: Object {
    enum Property: String {
        case id
        case name
        case temperature
        case dateTimeCurrent
        case lat
        case lon
    }
    
    @objc dynamic var dateTimeCurrent = 0
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var temperature = 0.0
    @objc dynamic var lat = 0.0
    @objc dynamic var lon = 0.0
    
    override static func primaryKey() -> String? {
        return RealmWeather.Property.id.rawValue
    }
    
    convenience init(_ dateTimeCurrent: Int, _ id: Int, _ lat: Double, _ lon: Double, _ name: String, _ temperature: Double) {
        self.init()
        self.dateTimeCurrent = dateTimeCurrent
        self.id = id
        self.name = name
        self.temperature = temperature
        self.lat = lat
        self.lon = lon
    }
}

