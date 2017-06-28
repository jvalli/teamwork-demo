//
//  TWConstants.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/20/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import Foundation
import UIKit

class TWConstants {
    
    public struct Teamwork {
        public static let token = "{Your Teamwork API token}"
        public static let host = "{Your Teamwork host URL}"
    }
    
    public struct API {
        public struct Headers {
            public static let contentType = "Content-Type"
            public static let applicationJson = "application/json"
            public static let accept = "Accept"
            public static let authorization = "Authorization"
            public static let basic = "Basic"
        }
        
        public struct Endpoints {
            public static let projects = "/projects.json"
            public static let projectTasks = "/projects/%@/tasks.json"
        }
        
        public struct StatusCodes {
            public static let success = 200
        }
        
        public struct Keys {
            public static let projects = "projects"
            public static let id = "id"
            public static let name = "name"
            public static let description = "description"
            public static let logo = "logo"
            public static let todoItems = "todo-items"
            public static let content = "content"
        }
    }
    
    public struct UI {
        public struct CellIdentifiers {
            public static let projectCell = "TWProjectCell"
            public static let taskCell = "TWTaskCell"
        }
        
        public struct MimeTypes {
            public static let image = "image"
        }
    }
    
    public struct Colors {
        public static let transparentGray = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 0.7)
    }
    
    public struct Segues {
        public static let goToTasksScreen = "GoToTasksScreen"
    }
}
