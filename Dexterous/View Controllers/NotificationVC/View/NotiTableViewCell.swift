//
//  NotiTableViewCell.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//

import UIKit

class NotiTableViewCell: UITableViewCell {

    @IBOutlet weak var desclbl: UILabel!
    @IBOutlet weak var timelinelbl: UILabel!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var imageicon: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
