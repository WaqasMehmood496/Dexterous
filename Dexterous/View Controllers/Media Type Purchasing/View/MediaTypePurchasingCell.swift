//
//  MediaTypePurchasingCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class MediaTypePurchasingCell: UITableViewCell {

    @IBOutlet weak var PlanPriceLabel: UILabel!
    @IBOutlet weak var BenifitOne: UILabel!
    @IBOutlet weak var BenifitTwo: UILabel!
    @IBOutlet weak var BenifitThree: UILabel!
    @IBOutlet weak var PurchaseWithPlanBtn: UIButton!
    @IBOutlet weak var PurchaseBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
