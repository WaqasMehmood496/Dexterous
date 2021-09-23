//
//  DashboardMediaTypeCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class DashboardMediaTypeCell: UITableViewCell {
    
    @IBOutlet weak var MediaTypeIcon: UIImageView!
    @IBOutlet weak var MediaTitle: UILabel!
    @IBOutlet weak var UpperBar: UIView!
    @IBOutlet weak var RectangleView: UIView!
    @IBOutlet weak var HeadingOneLabel: UILabel!
    @IBOutlet weak var HeadingTwoLabel: UILabel!
    @IBOutlet weak var HeadingThreeLabel: UILabel!
    @IBOutlet weak var HeadingFourLabel: UILabel!
    @IBOutlet weak var HeadingFiveLabel: UILabel!
    @IBOutlet weak var HeadingSixLabel: UILabel!
    
    @IBOutlet weak var HeadingOneValue: UILabel!
    @IBOutlet weak var HeadingTwoValue: UILabel!
    @IBOutlet weak var HeadingThreeValue: UILabel!
    @IBOutlet weak var HeadingFourValue: UILabel!
    @IBOutlet weak var HeadingFiveValue: UILabel!
    @IBOutlet weak var HeadingSixValue: UILabel!
    
    @IBOutlet weak var FaceboolBtn: UIButton!
    @IBOutlet weak var TwitterBtn: UIButton!
    @IBOutlet weak var LinkedInBtn: UIButton!
    @IBOutlet weak var BackShadeView: UIView!
    @IBOutlet weak var CrossBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
