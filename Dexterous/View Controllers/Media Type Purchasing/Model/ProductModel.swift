//
//  MediaTypeModel.swift
//  Dexterous
//
//  Created by Mac on 30/09/2021.
//

import Foundation


class ProductModel: Codable {
    
    var mediaType:String!
    var mediaLogo:String!
    var mediaColor:String!
    var produtsTypes:[ProductTypesModel]!

    init(mediaType: String? = nil,mediaLogo: String? = nil,mediaColor: String? = nil,produtsTypes: [ProductTypesModel]? = nil) {
        self.mediaType = mediaType
        self.mediaLogo = mediaLogo
        self.mediaColor = mediaColor
        self.produtsTypes = produtsTypes

    }
    
    init?(dic:NSDictionary) {
        if let produtsTypes = (dic as AnyObject).value(forKey: Constant.produtsTypes) as? NSArray {
            var array = [ProductTypesModel]()
            for product in produtsTypes{
                let tempObj = ProductTypesModel(dic: product as! NSDictionary)
                if let product = tempObj {
                    self.produtsTypes.append(product)
                }
            }
        }
        
        let mediaType = (dic as AnyObject).value(forKey: Constant.mediaType) as? String
        let mediaLogo = (dic as AnyObject).value(forKey: Constant.mediaLogo) as? String
        let mediaColor = (dic as AnyObject).value(forKey: Constant.mediaColor) as? String
        
        self.mediaType = mediaType
        self.mediaLogo = mediaLogo
        self.mediaColor = mediaColor
        
    }
}

class ProductTypesModel: Codable {
    
    var title: String!
    var price:String!
    var benifit:[String]!

    init(title:String? = nil,price: String? = nil,benifit: [String]? = nil) {
        self.title = title
        self.price = price
        self.benifit = benifit
    }
    
    init?(dic:NSDictionary) {
        
        let title = (dic as AnyObject).value(forKey: Constant.title) as? String
        let price = (dic as AnyObject).value(forKey: Constant.price) as! String
        if let benifit = (dic as AnyObject).value(forKey: Constant.benifit) as? [String] {
            for benifit in benifit {
                self.benifit.append(benifit)
            }
        }
        
        self.title = title
        self.price = price
        
    }
}
