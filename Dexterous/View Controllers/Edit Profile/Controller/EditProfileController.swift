//
//  EditProfileController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 23/09/2021.
//

import UIKit
import SwiftEntryKit

class EditProfileController: UIViewController {
    
    //IBOUTLTE'S
    @IBOutlet weak var EditProfileTableView: UITableView!
    
    //VARIABLE'S
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.freeTrailPopUp()
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func SaveBtnAction(_ sender: UIButton) {
    }
}

//MARK:- UITABLEVIEW DARASOURCE AND DELEGATE METHOD'S
extension EditProfileController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileImageTableViewCell", for: indexPath) as! ProfileImageTableViewCell
            cell.UploadImageBtn.tag = indexPath.row
            cell.UploadImageBtn.addTarget(self, action: #selector(UpdateImageBtnAction(_:)), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileFieldsTableViewCell", for: indexPath) as! EditProfileFieldsTableViewCell
            cell.FirstNameTF.text = "Elizabeth"
            cell.LastNameTF.text = "Olsen"
            cell .EmailTF.text = "Elizabetholsen@gmail.com"
            cell.PhoneNumberTF.text = "+98 123 4567 89"
            cell.PasswordTF.text = "+98 123 4567 89"
            return cell
        }
    }
    
    @objc func UpdateImageBtnAction (_ sender:UIButton) {
        
    }
}
