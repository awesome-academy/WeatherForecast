//
//  Double+Extension.swift
//  Common
//
//  Created by Tuấn Bờm on 5/4/18.
//  Copyright © 2018 Tuấn Bờm. All rights reserved.
//

import Foundation

extension Double {
    func getStringNoDecimal() -> String {
        return String(format: "%.0f", self)
    }

    func getStringOneDecimal() -> String {
        return String(format: "%.1f", self)
    }

    func getCelciusFromKelvin() -> String {
        let celcius = String(format: "%.0f", (self - 273.15))
        return celcius
    }
}
