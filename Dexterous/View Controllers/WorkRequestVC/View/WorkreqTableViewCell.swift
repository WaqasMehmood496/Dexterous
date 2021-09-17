//
//  WorkreqTableViewCell.swift
//  Dexterous
//
//  Created by Macbook Air on 9/16/21.
//

import UIKit

class WorkreqTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var celllbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
