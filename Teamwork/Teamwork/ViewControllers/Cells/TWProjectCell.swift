//
//  TWProjectCell.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import UIKit

class TWProjectCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    public func loadCell(with project: TWProject) {
        
        labelName.text = project.projectName
    }
}
