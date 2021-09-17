//
//  AddTeam1TableViewCell.swift
//  Dexterous
//
//  Created by Macbook Air on 9/15/21.
//

import UIKit

class AddTeam1TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionviewCell: UICollectionView!
    @IBOutlet weak var maintext: UILabel!
    
    @IBOutlet weak var buttonTeam: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
