//
//  DashboardMediaCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class DashboardMediaCell: UITableViewCell {

    @IBOutlet weak var FacebookBtn: UIButton!
    @IBOutlet weak var FacebookBatchNumberLabel: UILabel!
    @IBOutlet weak var YoutubeBtn: UIButton!
    @IBOutlet weak var YoutubeBatchNumberLabel: UILabel!
    @IBOutlet weak var LinkedInBtn: UIButton!
    @IBOutlet weak var LinkedInBatchNumberLabel: UILabel!
    @IBOutlet weak var InstagramBtn: UIButton!
    @IBOutlet weak var InstagramBatchNumberLabel: UILabel!
    @IBOutlet weak var TwitterBtn: UIButton!
    @IBOutlet weak var TwitterBatchNumberLabel: UILabel!
    @IBOutlet weak var WebBtn: UIButton!
    @IBOutlet weak var WebBatchNumberLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
