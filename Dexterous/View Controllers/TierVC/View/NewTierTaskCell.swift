//
//  NewTierTaskCell.swift
//  Dexterous
//
//  Created by Mac on 07/10/2021.
//

import UIKit

class NewTierTaskCell: UITableViewCell {

    @IBOutlet weak var TaskNameField: UITextField!
    @IBOutlet weak var MembersCollection: UICollectionView!
    @IBOutlet weak var MembersCollectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var AssignSomeoneBtn: UIButton!
    @IBOutlet weak var AssignLaterBtn: UIButton!
    @IBOutlet weak var DueDateLabel: UILabel!
    @IBOutlet weak var CalanderBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
