//
//  ProjectFeaturesTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 17/09/2021.
//

import UIKit

class ProjectFeaturesTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var CheckMarkBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
