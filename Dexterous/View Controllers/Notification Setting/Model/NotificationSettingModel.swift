//
//  NotificationSettingModel.swift
//  Dexterous
//
//  Created by Mac on 07/10/2021.
//

import Foundation

class NotificationSettingModel: Codable {
    
    var notificationTitle: String!
    var notificationType: String!
    
    init(notificationTitle:String? = nil,notificationType: String? = nil) {
        self.notificationTitle = notificationTitle
        self.notificationType = notificationType
    }
    
    init?(dic:NSDictionary) {
        
        let notificationTitle = (dic as AnyObject).value(forKey: Constant.notificationTitle) as? String
        let notificationType = (dic as AnyObject).value(forKey: Constant.notificationType) as! String
        
        self.notificationTitle = notificationTitle
        self.notificationType = notificationType
        
    }
}
