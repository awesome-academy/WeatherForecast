//
//  ServiceRequest.swift
//  Carival
//
//  Created by Tuấn Bờm on 7/25/18.
//  Copyright © 2018 Tuấn Bờm. All rights reserved.
//

import UIKit
import Alamofire

final class ServiceRequest<T: CoreObject> {

	private var cloudResponseClosure: ((T) -> Void)?
	private var cloudErrorClosure: ((_ status: String, _ code: Int?) -> Void)?
	private var finallyClosure: (() -> Void)?
	
	var cachedResult: T!
	
	public init() {
		self.cloudResponseClosure = nil
		self.cloudErrorClosure = nil
	}
	
	@discardableResult
	func cloudResponse(_ closure: ((T) -> Void)? = nil) -> Self {
		self.cloudResponseClosure = closure
		return self
	}
	
	@discardableResult
	func cloudError(_ closure: ((_ status: String, _ code: Int?) -> Void)? = nil) -> Self {
		self.cloudErrorClosure = closure
		return self
	}
	
	@discardableResult
	func finally(_ closure: (() -> Void)?) -> Self {
		self.finallyClosure = closure
		return self
	}
	
    func handleResponseJSON(response: DataResponse<Any>) {
        defer {
            finallyClosure?()
        }
		
        guard response.error == nil, let result = response.value as? [String: Any] else {
            handleError(error: response.error)
            return
        }
        
        guard let statusCode = response.response?.statusCode, statusCode == 200 else {
            if let error = result["error"] as? [String: Any],
                let message = error["message"] as? String {
                cloudErrorClosure?(message, response.response?.statusCode)
                return
            }
            cloudErrorClosure?("errorFromServer".localized, 500)
            return
        }
        
        cloudResponseClosure?(T(data: result))
    }
    
    func handleResponseArray(response: DataResponse<Any>) {
        defer {
            finallyClosure?()
        }
        
        guard response.error == nil, let result = response.value as? [Any] else {
            handleError(error: response.error)
            return
        }
        
        guard let statusCode = response.response?.statusCode, statusCode == 200 else {
            cloudErrorClosure?("errorFromServer".localized, response.response?.statusCode)
            return
        }
        
        cloudResponseClosure?(T(data: [kArrayKey: result]))
    }
	
	func handleError(error: Error?) {
		guard let error = error else {
			// Revisit to change error message
			cloudErrorClosure?("errorFromServer".localized, 500)
			return
		}
		
		cloudErrorClosure?(error.localizedDescription, 500)
	}
}
