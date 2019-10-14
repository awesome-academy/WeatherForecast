//
//  String+Extension.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/14/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

extension String {
    func removeWhiteSpaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }

    func removeStartEndWhiteSpaces() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }

}
