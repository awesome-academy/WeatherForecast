//
//  SeverResponseObject.swift
//  MozaEBook
//
//  Created by mac one on 1/8/19.
//  Copyright © 2019 mac one. All rights reserved.
//

import Foundation

class ServerResponseObject: CoreObject {
    
    var statusCode: Int?
    var statusMesage: String?
    var status: String?
    
    required init(data: [AnyHashable: Any]?) {
        statusCode = data?["code"] as? Int
        statusMesage = data?["message"] as? String
        status = data?["status"] as? String
    }
}
