//
//  DashboardProjectsCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit

class DashboardProjectsCell: UITableViewCell {
    
    @IBOutlet weak var ProjectNameLabel: UILabel!
    @IBOutlet weak var ProjectProgress: UIProgressView!
    @IBOutlet weak var ProgressValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
