//
//  ProfileImageTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 23/09/2021.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell {

    //IBAOUTLET'S
    @IBOutlet weak var UserProfileImage: UIImageView!
    @IBOutlet weak var UploadImageBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
