//
//  ProjectTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 16/09/2021.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var ProjectTitle: UILabel!
    @IBOutlet weak var ProjectData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
