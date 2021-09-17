//
//  BasicPlanTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 16/09/2021.
//

import UIKit

class BasicPlanTableViewCell: UITableViewCell {

    @IBOutlet weak var PlanTitle: UILabel!
    @IBOutlet weak var Amount: UILabel!
    @IBOutlet weak var Benifit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
