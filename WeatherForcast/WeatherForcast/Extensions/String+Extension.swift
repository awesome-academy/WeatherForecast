//
//  String+Extension.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/14/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

extension String {
    func removeWhiteSpaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }

    func removeStartEndWhiteSpaces() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }

    func toVietNameseString() -> String {
        switch self {
        case "Monday":
            return "Thứ Hai"
        case "Tuesday":
            return "Thứ Ba"
        case "Wednesday":
            return "Thứ Tư"
        case "Thursday":
            return "Thứ Năm"
        case "Friday":
            return "Thứ Sáu"
        case "Saturday":
            return "Thứ Bảy"
        case "Sunday":
            return "Chủ Nhật"
        default:
            return self
        }
    }

    func toWeatherIcon() -> UIImage {
        switch self {
        case "Rain":
            return #imageLiteral(resourceName: "rain_image")
        case "Clouds":
            return #imageLiteral(resourceName: "cloud_image")
        case "Clear":
            return #imageLiteral(resourceName: "sunny_image")
        default:
            return #imageLiteral(resourceName: "cloud_image")
        }
    }
}
