//
//  MyTask3TableViewCell.swift
//  Dexterous
//
//  Created by Macbook Air on 9/14/21.
//

import UIKit

class MyTask3TableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userimg: UIImageView!
    @IBOutlet weak var tasknamelbl: UILabel!
    @IBOutlet weak var completedlbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
