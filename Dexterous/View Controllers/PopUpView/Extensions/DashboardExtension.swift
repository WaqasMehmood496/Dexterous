//
//  DashboardExtension.swift
//  Dexterous
//
//  Created by Mac on 01/10/2021.
//

import Foundation
import UIKit

//MARK: - DASHBOARD OPTIONS HANDLING
extension popviewViewController {
    func dashboardControllerOptions(indexPath:IndexPath) {
        if indexPath.row == 0 {
            self.dismiss(animated: false) {
                self.dashBoardDelegate.moveToNewChat()
            }
        } else if indexPath.row == 1 {
            self.dismiss(animated: false) {
                self.dashBoardDelegate.moveToAddTask()
            }
        } else if indexPath.row == 3 {
            self.dismiss(animated: false) {
                self.dashBoardDelegate.moveToCreateProject()
            }
        } else if indexPath.row == 4 {
            self.dismiss(animated: false) {
                self.dashBoardDelegate.moveToMarkeeting()
            }
        }
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
}
