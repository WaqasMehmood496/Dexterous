//
//  profile1TableViewCell.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//

import UIKit

class profile1TableViewCell: UITableViewCell {

    @IBOutlet weak var imageviww: UIImageView!
    @IBOutlet weak var timelinelbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var UserActiveStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
