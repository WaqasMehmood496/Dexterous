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
    
    //CONSTANT'S
    let checkBoxImage = "Icon awesome-check"
    
    //VARIABLE'S
    var settingArray = [
        NotificationSettingModel(notificationTitle: "Setting 1", notificationType: notificationTypeEnum.push.rawValue),
        NotificationSettingModel(notificationTitle: "Setting 2", notificationType: notificationTypeEnum.push.rawValue),
        NotificationSettingModel(notificationTitle: "Setting 3", notificationType: notificationTypeEnum.push.rawValue)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - HELPING METHOD'S
extension NotificationSettingController {
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
}


//MARK: - UITABLEVIEW DATASOURCE AND DELEGATE METHOD'S
extension NotificationSettingController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingArray.count
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
        
        cell.SettingTitleLabel.text = self.settingArray[indexPath.row].notificationTitle
        clearCellSelectionColor(cell: cell)
        
        switch notificationTypeEnum(rawValue: "push") {
        case .push:
            cell.PushCheckBoxBtn.setImage(UIImage(named: checkBoxImage), for: .normal)
        default:
            break
        }
        
        return cell
    }
    
    @objc func PushCheckBoxBtnAction (_ sender:UIButton) {
        
        let indexpath = IndexPath(row: sender.tag, section: 0)
        let cell = self.NotificationSettingsTableView.cellForRow(at: indexpath) as! NotificationSettingsCell
        cell.PushCheckBoxBtn.setImage(UIImage(named: checkBoxImage), for: .normal)
        cell.TextCheckBoxBtn.setImage(UIImage(named: ""), for: .normal)
        cell.EmailCheckBoxBtn.setImage(UIImage(named: ""), for: .normal)
        
    }
    
    @objc func TextCheckBoxBtnAction (_ sender:UIButton) {
        
        let indexpath = IndexPath(row: sender.tag, section: 0)
        let cell = self.NotificationSettingsTableView.cellForRow(at: indexpath) as! NotificationSettingsCell
        cell.PushCheckBoxBtn.setImage(UIImage(named: ""), for: .normal)
        cell.TextCheckBoxBtn.setImage(UIImage(named: checkBoxImage), for: .normal)
        cell.EmailCheckBoxBtn.setImage(UIImage(named: ""), for: .normal)
        
    }
    
    @objc func EmailCheckBoxBtnAction (_ sender:UIButton) {
        
        let indexpath = IndexPath(row: sender.tag, section: 0)
        let cell = self.NotificationSettingsTableView.cellForRow(at: indexpath) as! NotificationSettingsCell
        cell.PushCheckBoxBtn.setImage(UIImage(named: ""), for: .normal)
        cell.TextCheckBoxBtn.setImage(UIImage(named: ""), for: .normal)
        cell.EmailCheckBoxBtn.setImage(UIImage(named: checkBoxImage), for: .normal)
        
    }
    
}
