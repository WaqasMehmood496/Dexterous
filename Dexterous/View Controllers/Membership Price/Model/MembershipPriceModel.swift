//
//  MembershipPriceModel.swift
//  Dexterous
//
//  Created by Mac on 29/09/2021.
//

import Foundation

class MembershipPriceModel: Codable {
    
    var title: String!
    var price:String!
    var description:String!
    var color:String!
    
    init(title:String? = nil,price: String? = nil,description: String? = nil,color: String? = nil) {
        self.title = title
        self.price = price
        self.description = description
        self.color = color
    }
    
    init?(dic:NSDictionary) {
        
        let title = (dic as AnyObject).value(forKey: Constant.title) as? String
        let price = (dic as AnyObject).value(forKey: Constant.price) as! String
        let description = (dic as AnyObject).value(forKey: Constant.description) as? String
        let color = (dic as AnyObject).value(forKey: Constant.color) as? String
        
        
        self.title = title
        self.price = price
        self.description = description
        self.color = color
    }
}
