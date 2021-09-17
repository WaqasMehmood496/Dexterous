//
//  ProjectOverViewTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 17/09/2021.
//

import UIKit

class ProjectOverViewTableViewCell: UITableViewCell {

    @IBOutlet weak var ProjectTitleLable: UILabel!
    @IBOutlet weak var ProjectDescriptionLabel: UILabel!
    @IBOutlet weak var ProjectInvitationsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
