//
//  OthersOptionCell.swift
//  Dexterous
//
//  Created by Mac on 06/10/2021.
//

import UIKit

class OthersOptionCell: UITableViewCell {

    //IBOUTLET
    @IBOutlet weak var CallBtn: UIButton!
    @IBOutlet weak var MessageBtn: UIButton!
    @IBOutlet weak var EmailBtn: UIButton!
    @IBOutlet weak var ChangeTeamBtn: UIButton!
    @IBOutlet weak var AddProjectBtn: UIButton!
    @IBOutlet weak var AddAccountBtn: UIButton!
    @IBOutlet weak var DeleteAccountBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
