//
//  TWProjectCell.swift
//  Teamwork
//
//  Created by Jerónimo Valli on 6/28/17.
//  Copyright © 2017 Teamwork. All rights reserved.
//

import UIKit

class TWProjectCell: UITableViewCell {
    
    // MARK: - # Variables
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageViewLogo: UIImageView!
    
    // MARK: - # Public functions
    
    public func loadCell(with project: TWProject) {
        
        labelName.text = project.projectName
        labelDescription.text = project.projectDescription
        if let logoUrl = project.projectLogo {
            imageViewLogo.downloadedFrom(link: logoUrl, contentMode: .scaleAspectFill)
        }
    }
}
