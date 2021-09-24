//
//  tiertfTableViewCell.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit

class tiertfTableViewCell: UITableViewCell {

    @IBOutlet weak var TaskNameField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        TaskNameField.setLeftPaddingPoints(8)
        TaskNameField.setRightPaddingPoints(8)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
