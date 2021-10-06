//
//  profile2TableViewCell.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//

import UIKit



class profile2TableViewCell: UITableViewCell {
    //IBOUTLET
    @IBOutlet weak var imageicon: UIImageView!
    @IBOutlet weak var lbltitle_ame: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
