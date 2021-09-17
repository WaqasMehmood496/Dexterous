//
//  SideMenuModel.swift
//  Dexterous
//
//  Created by Buzzware Tech on 14/09/2021.
//

import Foundation

struct SideMenuModel {
    var groupTitle: String!
    var data: [SideMenuOptionModel]!
    init(data:[SideMenuOptionModel],groupTitle:String) {
        self.groupTitle = groupTitle
        self.data = data
    }
}

struct SideMenuOptionModel {
    
    var image: String!
    var title: String!
    var type: String
    
    init(image:String,title:String,type:String) {
        self.image = image
        self.title = title
        self.type = type
    }
}
