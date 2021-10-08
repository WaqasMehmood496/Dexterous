//
//  AllTaskTierCell.swift
//  Dexterous
//
//  Created by Mac on 07/10/2021.
//

import UIKit

class AllTaskTierCell: UITableViewCell {

    @IBOutlet weak var TaskNumber: UILabel!
    @IBOutlet weak var TaskTitle: UILabel!
    @IBOutlet weak var TaskMembers: UICollectionView!
    @IBOutlet weak var DueDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
