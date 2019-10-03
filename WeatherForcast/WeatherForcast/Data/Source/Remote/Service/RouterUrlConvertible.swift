//
//  RouterUrlConvertible.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/1/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

class RouterUrlConvertible: URLRequestConvertible {
    
    open var urlRequest: URLRequest!
    
    private let jsonEncoding = JSONEncoding()
    private let urlEndcoding = URLEncoding()
    
    public init(route: Route) {
        var urlPath = route.path
        
        if let queryParams = route.queryParams {
            urlPath = queryParameterEncodedRequestURL(urlPath, queryParams: queryParams)
        }
        
        if kWeatherMapKey.isEmpty == false   {
            urlPath = queryParameterEncodedRequestURL(urlPath, queryParams: ["appid": kWeatherMapKey])
        }
        
        var buildUrlRequest = try? URLRequest(url: urlPath, method: route.method)
        buildUrlRequest?.cachePolicy = .reloadIgnoringLocalCacheData
        
        guard let urlRequestUnwrapp = buildUrlRequest else {return}
        
        if let bodyParams = route.jsonParams {
            buildUrlRequest = try? jsonEncoding.encode(urlRequestUnwrapp, with: bodyParams)
        }
        urlRequest = buildUrlRequest
    }
    
    func asURLRequest() throws -> URLRequest {
        return urlRequest
    }
    
    private func queryParameterEncodedRequestURL(_ urlString: String, queryParams: [String: Any]) -> String {
        
        guard let url = URL(string: urlString) else {return urlString}
        
        guard let request = try? urlEndcoding.encode(URLRequest(url: url), with: queryParams), let encodeUrlString = request.url?.absoluteString else {return urlString}
        return encodeUrlString.replacingOccurrences(of: "%5B%5D", with: "")
    }
}
