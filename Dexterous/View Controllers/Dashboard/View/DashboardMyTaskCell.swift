//
//  DashboardMyTaskCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class DashboardMyTaskCell: UITableViewCell {

    @IBOutlet weak var TaskNameLabel: UILabel!
    @IBOutlet weak var AssignByUserImage: UIImageView!
    @IBOutlet weak var AssignByLabel: UILabel!
    @IBOutlet weak var DueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
