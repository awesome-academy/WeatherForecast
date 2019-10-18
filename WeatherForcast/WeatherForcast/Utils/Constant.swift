//
//  Constant.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/1/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct Message {
    static let errorMessage = "Đã xảy ra lỗi, xin vui lòng thử lại"
    static let errorTitle = "Thông báo"
}

struct TableRow {
    static let bannerRow = 1
    static let temperatureRow = 1
    static let detailRow = 1
}

struct Result {
    static let hourFilter = "06"
    static let overLimit = "OVER_QUERY_LIMIT"
    static let arrayKey = "arrayData"
}
