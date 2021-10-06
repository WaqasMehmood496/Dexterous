//
//  NewChatCell.swift
//  Dexterous
//
//  Created by Mac on 02/10/2021.
//

import UIKit

class NewChatCell: UITableViewCell {
    
    //IBOUTLET'S
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
