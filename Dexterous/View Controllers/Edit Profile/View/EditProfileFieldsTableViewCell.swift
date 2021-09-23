//
//  EditProfileFieldsTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 23/09/2021.
//

import UIKit

class EditProfileFieldsTableViewCell: UITableViewCell {

    @IBOutlet weak var FirstNameTF: UITextField!
    @IBOutlet weak var LastNameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PhoneNumberTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
