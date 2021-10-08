//
//  TierTaskModel.swift
//  Dexterous
//
//  Created by Mac on 08/10/2021.
//

import Foundation
class TierTaskModel: Codable {
    
    var taskNumber: String!
    var taskName:String!
    var assigTo:[String]!
    var duaDate:String!
    
    init(taskNumber:String? = nil,taskName: String? = nil,assigTo: [String]? = nil,duaDate: String? = nil) {
        self.taskNumber = taskNumber
        self.taskName = taskName
        self.assigTo = assigTo
        self.duaDate = duaDate
    }
    
    init?(dic:NSDictionary) {
        
        let taskNumber = (dic as AnyObject).value(forKey: Constant.taskNumber) as? String
        let taskName = (dic as AnyObject).value(forKey: Constant.taskName) as! String
        if let assigTo = (dic as AnyObject).value(forKey: Constant.assigTo) as? [String] {
            for assigTo in assigTo {
                self.assigTo.append(assigTo)
            }
        }
        let duaDate = (dic as AnyObject).value(forKey: Constant.duaDate) as? String
        
        self.taskNumber = taskNumber
        self.taskName = taskName
        self.duaDate = duaDate
        
    }
}
