//
//  ConnectionsTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 14/09/2021.
//

import UIKit

class ConnectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var ConnectionImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var OccupationLabel: UILabel!
    @IBOutlet weak var SelectionBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
