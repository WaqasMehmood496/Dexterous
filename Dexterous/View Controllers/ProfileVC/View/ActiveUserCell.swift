//
//  ActiveUserCell.swift
//  Dexterous
//
//  Created by Mac on 06/10/2021.
//

import UIKit

class ActiveUserCell: UITableViewCell {

    @IBOutlet weak var InHourLabel: UILabel!
    @IBOutlet weak var InWeekLabel: UILabel!
    @IBOutlet weak var InMonthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
