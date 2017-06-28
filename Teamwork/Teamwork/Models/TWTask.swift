//
//  TWTask.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import Foundation

class TWTask: NSObject {
    
    // MARK: - # Variables
    
    var taskId: String?
    var taskContent: String?
    
    // MARK: - # Life Cycle
    
    override init() {
        super.init()
    }
    
    convenience init(taskDictionary: [String: Any]) {
        self.init()
        
        if let id = taskDictionary[TWConstants.API.Keys.id] as? String {
            taskId = id
        }
        if let content = taskDictionary[TWConstants.API.Keys.content] as? String {
            taskContent = content
        }
    }
}
