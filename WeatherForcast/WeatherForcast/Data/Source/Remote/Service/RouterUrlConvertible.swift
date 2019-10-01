//
//  RouterUrlConvertible.swift
//  Common
//
//  Created by Tuấn Bờm on 5/19/18.
//  Copyright © 2018 Tuấn Bờm. All rights reserved.
//

import Foundation
import Alamofire

class RouterUrlConvertible: URLRequestConvertible {
    
    open var urlRequest: URLRequest!
    
    private let jsonEncoding = JSONEncoding()
    private let urlEncoding = URLEncoding()
    
    public init(route: Route) {
        var urlPath = route.path
        
        if let queryParams = route.queryParams {
            urlPath = queryParameterEncodedRequestURL(urlPath, queryParams: queryParams)
        }
        
        if let token = SessionManager.shared.token {
            urlPath = queryParameterEncodedRequestURL(urlPath, queryParams: ["access_token": token])
        }
        
        var buildUrlRequest = try? URLRequest(url: urlPath, method: route.method)
        buildUrlRequest?.cachePolicy = .reloadIgnoringLocalCacheData
        
        guard let urlRequestUnwrapp = buildUrlRequest else {
            return
        }
        
        if let bodyParams = route.jsonParams {
            buildUrlRequest = try? jsonEncoding.encode(urlRequestUnwrapp, with: bodyParams)
        }
        
        urlRequest = buildUrlRequest
    }
    
    public func asURLRequest() throws -> URLRequest {
        return urlRequest
    }
    
    private func queryParameterEncodedRequestURL(_ urlString: String, queryParams: [String: Any]) -> String {
        guard let url = URL(string: urlString) else {
            return urlString
        }
        
        guard let request = try? urlEncoding.encode(URLRequest(url: url), with: queryParams), let encodedUrlString = request.url?.absoluteString else {
            return urlString
        }
        
        return encodedUrlString.replacingOccurrences(of: "%5B%5D", with: "")
    }
}
