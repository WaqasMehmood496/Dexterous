//
//  UserPlanTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 16/09/2021.
//

import UIKit

class UserPlanTableViewCell: UITableViewCell {

    //IBOUTLET'S
    @IBOutlet weak var ManageMyPaymentBtn: UIButton!
    @IBOutlet weak var AddUserBtn: UIButton!
    @IBOutlet weak var UpgradeMyPlanBtn: UIButton!
    @IBOutlet weak var SeePreviousInvoicesBtn: UIButton!
    @IBOutlet weak var SareDexterousAppBtn: UIButton!
    @IBOutlet weak var AddMarketingBtn: UIButton!
    @IBOutlet weak var LearnMoreBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
