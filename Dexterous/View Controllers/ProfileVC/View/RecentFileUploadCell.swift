//
//  RecentFileUploadCell.swift
//  Dexterous
//
//  Created by Mac on 06/10/2021.
//

import UIKit

class RecentFileUploadCell: UITableViewCell {

    @IBOutlet weak var FileIcon: UIImageView!
    @IBOutlet weak var FileName: UILabel!
    @IBOutlet weak var FileSize: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
