//
//  AlamofireAppManager.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/1/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire
import netfox

final class AlamofireAppmanager: Alamofire.SessionManager {
    static let shared : AlamofireAppmanager = {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses?.insert(NFXProtocol.self, at: 0)
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        return AlamofireAppmanager(configuration: configuration)
    }()
}
