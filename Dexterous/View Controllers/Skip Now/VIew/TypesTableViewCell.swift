//
//  TypesTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit

class TypesTableViewCell: UITableViewCell {

    //IBOUTLET
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var PricePeriod: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
