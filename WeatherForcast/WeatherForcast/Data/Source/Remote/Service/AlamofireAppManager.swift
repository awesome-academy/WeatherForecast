//
//  AlamofireAppManager.swift
//  Common
//
//  Created by Tuấn Bờm on 5/19/18.
//  Copyright © 2018 Tuấn Bờm. All rights reserved.
//

import Foundation
import Alamofire
import netfox

final class AlamofireAppManager: Alamofire.SessionManager {
    
    static let shared: AlamofireAppManager = {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses?.insert(NFXProtocol.self, at: 0)
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        return AlamofireAppManager(configuration: configuration)
    }()
    
}
