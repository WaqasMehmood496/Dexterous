//
//  NotificationSettingsCell.swift
//  Dexterous
//
//  Created by Mac on 06/10/2021.
//

import UIKit

class NotificationSettingsCell: UITableViewCell {

    //IBOUTLET'S
    @IBOutlet weak var SettingTitleLabel: UILabel!
    @IBOutlet weak var PushCheckBoxBtn: UIButton!
    @IBOutlet weak var TextCheckBoxBtn: UIButton!
    @IBOutlet weak var EmailCheckBoxBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
