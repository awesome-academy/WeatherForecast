//
//  RequestParameterObject.swift
//  MozaEBook
//
//  Created by mac one on 1/8/19.
//  Copyright © 2019 mac one. All rights reserved.
//

import Foundation

protocol RequestParameterObject {
    func toJsonParam() -> [String: Any]
}
