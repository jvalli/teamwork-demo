//
//  TWBaseAPI.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/20/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TWBaseAPI: NSObject {
    
    // MARK: - # Constants
    
    public typealias TWOnResponseHandler = (_ response: Any?, _ error: Error?) -> Void
    
    fileprivate let headers: [String: String] = {
        let credentialData = "\(TWConstants.API.token):".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString()
        return [TWConstants.API.Headers.contentType: TWConstants.API.Headers.applicationJson,
                TWConstants.API.Headers.accept: TWConstants.API.Headers.applicationJson,
                TWConstants.API.Headers.authorization: "\(TWConstants.API.Headers.basic) \(base64Credentials)"]
    }()
    
    // MARK: - # Singleton
    
    static let shared = TWBaseAPI()
    
    override init() {
        super.init()
    }
    
    // MARK: - # Public Functions
    
    public func GET(endpoint: String, parameters: Parameters?, handler: TWOnResponseHandler?) {
        
        Alamofire.request("\(TWConstants.API.host)\(endpoint)", method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                
                if let error = response.error {
                    handler?(nil, error)
                } else if let json = response.result.value {
                    print("JSON: \(json)")
                    handler?(json, nil)
                }
        }
    }
}
