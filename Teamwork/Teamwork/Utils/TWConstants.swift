//
//  TWConstants.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/20/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import Foundation

class TWConstants {
    
    public struct API {
        public static let token = "twp_eUrUN6H62LGk6j4lwvZedirhyFr0"
        public static let host = "https://bminds.teamwork.com"
        
        public struct Headers {
            public static let contentType = "Content-Type"
            public static let applicationJson = "application/json"
            public static let accept = "Accept"
            public static let authorization = "Authorization"
            public static let basic = "Basic"
        }
        
        public struct Endpoints {
            public static let projects = "/projects.json"
        }
    }
}
