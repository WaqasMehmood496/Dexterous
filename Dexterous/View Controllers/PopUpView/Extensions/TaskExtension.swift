//
//  TaskExtension.swift
//  Dexterous
//
//  Created by Mac on 01/10/2021.
//

import Foundation
import UIKit

extension popviewViewController {
    func taskControllerOptions(indexPath:IndexPath) {
        if indexPath.row == 0 {
            self.dismiss(animated: true) {
                self.taskDelegate.moveToAddTask()
            }
        } else if indexPath.row == 1 {
            self.dismiss(animated: true) {
                self.taskDelegate.moveToCreateProjectTask()
            }
        }
    }
}
