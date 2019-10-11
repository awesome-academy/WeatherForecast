//
//  UIColor+Extension.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red) / 255.0
        let newGreen = CGFloat(green) / 255.0
        let newBlue = CGFloat(blue) / 255.0
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
