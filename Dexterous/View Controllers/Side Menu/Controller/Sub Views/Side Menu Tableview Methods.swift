//
//  Side Menu Tableview Methods.swift
//  Dexterous
//
//  Created by Mac on 08/10/2021.
//

import Foundation
import UIKit

//MARK: - SIDEMENU TABLEVIEW HELPING METHOD'S
extension SideMenuController {
    //MARK: - SECTION 0
    func peopleSectionCell(indexPath:IndexPath,tableView:UITableView) -> UITableViewCell {
        
        if indexPath.row >= sideMenuArray[indexPath.section].data.count {
            //INVITE TABLEVIEW CELL
            let cell = tableView.dequeueReusableCell(withIdentifier: "InviteConnectionsTableViewCell", for: indexPath) as! InviteConnectionsTableViewCell
            cell.InviteBtn.addTarget(self, action: #selector(inviteBtnAction(_:)), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
            cell.ConnectionImage.image = UIImage(named: self.sideMenuArray[indexPath.section].data[indexPath.row].image)
            cell.NameLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].title
            cell.OccupationLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].type
            return cell
        }
    }
    
    //MARK: - SECTION 1
    func dexterousSectionCell(indexPath:IndexPath,tableView:UITableView) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
        cell.ConnectionImage.image = UIImage(named: self.sideMenuArray[indexPath.section].data[indexPath.row].image)
        cell.NameLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].title
        cell.OccupationLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].type
        
        return cell
    }
    
    //MARK: - SECTION 2
    
    func notificationsSectionCell(indexPath:IndexPath,tableView:UITableView) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
        cell.ConnectionImage.image = UIImage(named: self.sideMenuArray[indexPath.section].data[indexPath.row].image)
        cell.NameLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].title
        cell.OccupationLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].type
        
        cell.SelectionBtn.tag = indexPath.row
        
        if self.sideMenuArray[indexPath.section].data[indexPath.row].title == "Notifications"{
            cell.SelectionBtn.addTarget(self, action: #selector(notificationBtnAction(_:)), for: .touchUpInside)
        } else {
            cell.SelectionBtn.addTarget(self, action: #selector(editTeamsBtnAction(_:)), for: .touchUpInside)
        }
        
        return cell
    }
    
    //MARK: - SECTION 3
    
    func otherSectionCell(indexPath:IndexPath,tableView:UITableView) -> UITableViewCell {
        if indexPath.row >= sideMenuArray[indexPath.section].data.count {
            //INVITE TABLEVIEW CELL
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath) as! OtherTableViewCell
            cell.AddMarketingBtn.tag = indexPath.row
            cell.AddMarketingBtn.addTarget(self, action: #selector(addMarketingBtnAction(_:)), for: .touchUpInside)
            cell.ScheduleBtn.tag = indexPath.row
            cell.ScheduleBtn.addTarget(self, action: #selector(scheduleAMettingBtnAction(_:)), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionsTableViewCell", for: indexPath) as! ConnectionsTableViewCell
            cell.ConnectionImage.image = UIImage(named: self.sideMenuArray[indexPath.section].data[indexPath.row].image)
            cell.NameLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].title
            cell.OccupationLabel.text = self.sideMenuArray[indexPath.section].data[indexPath.row].type
            cell.SelectionBtn.tag = indexPath.row
            cell.SelectionBtn.addTarget(self, action: #selector(BillingBtnAction(_:)), for: .touchUpInside)
            return cell
        }
    }
}

//MARK: - SECTIONS BUTTONS ACTION'S
extension SideMenuController {
    
    @objc func inviteBtnAction ( _ sender:UIButton) {
        MoveToNextVC(identifier: "WhichTeamViewController")
    }
    
    @objc func notificationBtnAction(_ sender:UIButton) {
        MoveToNextVC(identifier: "NotificationViewController")
    }
    
    @objc func editTeamsBtnAction(_ sender:UIButton) {
        MoveToNextVC(identifier: "EditTeamViewController")
    }
    
    @objc func addMarketingBtnAction(_ sender:UIButton) {
        MoveToNextVC(identifier: "MemberShipController")
    }
    
    @objc func scheduleAMettingBtnAction(_ sender:UIButton) {
        MoveToNextVC(identifier: "MyUpcommingMeetingController")
    }
    
    @objc func BillingBtnAction(_ sender:UIButton) {
        //MoveToNextVC(identifier: "MediaTypePurchasingController")
    }
}
