//
//  ChatListTableViewCell.swift
//  Dexterous
//
//  Created by Macbook Air on 9/15/21.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewc: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblMessageTxt: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
