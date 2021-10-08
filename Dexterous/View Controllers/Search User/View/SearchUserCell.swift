//
//  SearchUserCell.swift
//  Dexterous
//
//  Created by Mac on 08/10/2021.
//

import UIKit

class SearchUserCell: UITableViewCell {

    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var SelectionCheckBoxBtn: UIButton!
    @IBOutlet weak var UserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
