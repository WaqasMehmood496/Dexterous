//
//  NotificationSettingController.swift
//  Dexterous
//
//  Created by Mac on 06/10/2021.
//

import UIKit

class NotificationSettingController: UIViewController {

    //IBOUTLET'S
    @IBOutlet weak var NotificationSettingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK: - UITABLEVIEW DATASOURCE AND DELEGATE METHOD'S
extension NotificationSettingController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationSettingsCell", for: indexPath) as! NotificationSettingsCell
        cell.PushCheckBoxBtn.setTitle("", for: .normal)
        cell.PushCheckBoxBtn.tag = indexPath.row
        cell.PushCheckBoxBtn.addTarget(self, action: #selector(PushCheckBoxBtnAction(_:)), for:
                                            .touchUpInside)
        cell.TextCheckBoxBtn.setTitle("", for: .normal)
        cell.TextCheckBoxBtn.tag = indexPath.row
        cell.TextCheckBoxBtn.addTarget(self, action: #selector(TextCheckBoxBtnAction(_:)), for:
                                            .touchUpInside)
        
        cell.EmailCheckBoxBtn.setTitle("", for: .normal)
        cell.EmailCheckBoxBtn.tag = indexPath.row
        cell.EmailCheckBoxBtn.addTarget(self, action: #selector(EmailCheckBoxBtnAction(_:)), for:
                                            .touchUpInside)
                
        return cell
    }
    
    @objc func PushCheckBoxBtnAction (_ sender:UIButton) {
        //Pending Work......
    }
    
    @objc func TextCheckBoxBtnAction (_ sender:UIButton) {
        //Pending Work......
    }
    
    @objc func EmailCheckBoxBtnAction (_ sender:UIButton) {
        //Pending Work......
    }
    
    
}
