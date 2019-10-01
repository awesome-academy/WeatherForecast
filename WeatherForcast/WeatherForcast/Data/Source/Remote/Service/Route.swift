//
//  Route.swift
//  Common
//
//  Created by Tuấn Bờm on 5/19/18.
//  Copyright © 2018 Tuấn Bờm. All rights reserved.
//

import Foundation
import Alamofire

final class Route {
    
    private(set) var method: HTTPMethod
    private(set) var path: String
    private(set) var queryParams: [String: Any]?
    private(set) var jsonParams: [String: Any]?
    private(set) var withAuthToken: String?
    
    public init(method: HTTPMethod,
                path: String,
                queryParams: [String: Any]? = nil,
                jsonParams: [String: Any]? = nil,
                withAuthToken: String? = nil
        ) {
        self.method = method
        self.path = path
        self.queryParams = queryParams
        self.jsonParams = jsonParams
        self.withAuthToken = withAuthToken
    }
}
