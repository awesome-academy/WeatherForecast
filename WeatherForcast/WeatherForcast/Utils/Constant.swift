//
//  Constant.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/1/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

struct Message {
    static let errorNotify = "Notify error"
    static let errorMessage = "Đã xảy ra lỗi, xin vui lòng thử lại"
    static let errorTitle = "Thông báo"
    static let errorNetwork = "Không có kết nối"
    static let cityNotFound = "city not found"
    static let errorCity = "Không tìm thấy dữ liệu về thành phố"
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
    static let titleSearchSceen = "Nhập tên thành phố bạn cần tìm kiếm"
}
