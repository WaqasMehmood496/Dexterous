//
//  SearchUserModel.swift
//  Dexterous
//
//  Created by Mac on 08/10/2021.
//

import Foundation

class SearchUserModel: Codable {
    
    var name:String!
    var imageName:String!
    var isChecked:Bool!

    init(name:String? = nil,imageName: String? = nil,isChecked: Bool? = false) {
        self.name = name
        self.imageName = imageName
        self.isChecked = isChecked

    }
    
    init?(dic:NSDictionary) {
        
        let name = (dic as AnyObject).value(forKey: Constant.name) as? String
        let imageName = (dic as AnyObject).value(forKey: Constant.imageName) as! String
        let isChecked = (dic as AnyObject).value(forKey: Constant.isChecked) as? Bool
        
        self.name = name
        self.imageName = imageName
        self.isChecked = isChecked
        
    }
}
