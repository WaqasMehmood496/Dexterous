//
//  MessageExtension.swift
//  Dexterous
//
//  Created by Mac on 01/10/2021.
//

import Foundation
import UIKit
extension popviewViewController {
    func messageControllerOption(indexPath:IndexPath) {
        if indexPath.row == 0 {
            self.dismiss(animated: true) {
                self.messageControllerDelegate.moveToEditTeam()
            }
        }
    }
    
}
