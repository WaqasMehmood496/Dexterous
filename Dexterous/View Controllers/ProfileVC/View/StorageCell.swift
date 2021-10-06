//
//  StorageCell.swift
//  Dexterous
//
//  Created by Mac on 06/10/2021.
//

import UIKit

class StorageCell: UITableViewCell {
    
    //IBOUTLET
    @IBOutlet weak var StorageProgress: UIProgressView!
    @IBOutlet weak var TotalUsedSpaceLabel: UILabel!
    @IBOutlet weak var TotalSpaceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
