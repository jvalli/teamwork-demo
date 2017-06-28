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
    var taskDescription: String?
    var isCompleted: Bool = false
    var creatorId: String?
    var creatorFirstname: String?
    var creatorLastname: String?
    var responsiblePartyId: String?
    var responsiblePartyFirstname: String?
    var responsiblePartyLastname: String?
    
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
        if let description = taskDictionary[TWConstants.API.Keys.description] as? String {
            taskDescription = description
        }
        if let completed = taskDictionary[TWConstants.API.Keys.completed] as? Bool {
            isCompleted = completed
        }
        if let theCreatorId = taskDictionary[TWConstants.API.Keys.creatorId] as? String {
            creatorId = theCreatorId
        }
        if let theCreatorFirstname = taskDictionary[TWConstants.API.Keys.creatorFirstname] as? String {
            creatorFirstname = theCreatorFirstname
        }
        if let theCreatorLastname = taskDictionary[TWConstants.API.Keys.creatorLastname] as? String {
            creatorLastname = theCreatorLastname
        }
        if let theResponsiblePartyId = taskDictionary[TWConstants.API.Keys.responsiblePartyId] as? String {
            responsiblePartyId = theResponsiblePartyId
        }
        if let theResponsiblePartyFirstname = taskDictionary[TWConstants.API.Keys.responsiblePartyFirstname] as? String {
            responsiblePartyFirstname = theResponsiblePartyFirstname
        }
        if let theResponsiblePartyLastname = taskDictionary[TWConstants.API.Keys.responsiblePartyLastname] as? String {
            responsiblePartyLastname = theResponsiblePartyLastname
        }
    }
}
