//
//  DashboardModel.swift
//  Dexterous
//
//  Created by Buzzware Tech on 14/09/2021.
//

import Foundation

class DashboardModel: Codable {
    
    var myTask: [MyTaskModel]!
    var projects:[ProjectsModel]!
    var media:MediaModel!
    var mediaType:[MediaTypeModel]!
    
    init(
        myTask:[MyTaskModel]? = nil,projects: [ProjectsModel]? = nil,
        media: MediaModel? = nil,mediaType: [MediaTypeModel]? = nil
    ) {
        
        self.myTask = myTask
        self.projects = projects
        self.media = media
        self.mediaType = mediaType

    }
    
    init?(dic:NSDictionary) {
        
        if let myTask = (dic as AnyObject).value(forKey: Constant.myTask) as? [MyTaskModel] {
            for task in myTask {
                self.myTask.append(task)
            }
        }
        if let projects = (dic as AnyObject).value(forKey: Constant.projects) as? [ProjectsModel] {
            for project in projects {
                self.projects.append(project)
            }
        }
        let media = (dic as AnyObject).value(forKey: Constant.media) as? MediaModel
        self.media = media
        
        if let mediaTypes = (dic as AnyObject).value(forKey: Constant.mediaType) as? [MediaTypeModel] {
            for mediaType in mediaTypes {
                self.mediaType.append(mediaType)
            }
        }        
    }
}

class MyTaskModel: Codable {
    
    var taskName: String!
    var assignBy:String!
    var due:String!
    
    
    init(taskName:String? = nil,assignBy: String? = nil,due: String? = nil) {
        self.taskName = taskName
        self.assignBy = assignBy
        self.due = due
    }
    
    init?(dic:NSDictionary) {
        
        let taskName = (dic as AnyObject).value(forKey: Constant.taskName) as? String
        let assignBy = (dic as AnyObject).value(forKey: Constant.assignBy) as! String
        let due = (dic as AnyObject).value(forKey: Constant.due) as? String
        
        self.taskName = taskName
        self.assignBy = assignBy
        self.due = due
    }
}

class ProjectsModel: Codable {
    
    var projectName: String!
    var progressValue:String!
    var progressPercentage:String!
    
    init(projectName:String? = nil,progressValue: String? = nil,progressPercentage: String? = nil) {
        self.projectName = projectName
        self.progressValue = progressValue
        self.progressPercentage = progressPercentage
    }
    
    init?(dic:NSDictionary) {
        
        let projectName = (dic as AnyObject).value(forKey: Constant.projectName) as? String
        let progressValue = (dic as AnyObject).value(forKey: Constant.progressValue) as! String
        let progressPercentage = (dic as AnyObject).value(forKey: Constant.progressPercentage) as? String
        
        self.projectName = projectName
        self.progressValue = progressValue
        self.progressPercentage = progressPercentage
        
    }
}

class MediaModel: Codable {
    
    var images: [String]!
    
    init(images:[String]? = nil) {
        self.images = images
    }
    
    init?(dic:NSDictionary) {
        
        if let images = (dic as AnyObject).value(forKey: Constant.images) as? [String] {
            for image in images {
                self.images.append(image)
            }
        }
    }
}

class MediaTypeModel: Codable {
    
    var typeImage: String!
    var titleOne:String!
    var titleOneValue:String!
    var titleTwo:String!
    var titleTwoValue:String!
    var titleThree:String!
    var titleThreeValue:String!
    var titleFour:String!
    var titleFourValue:String!
    var titleFive:String!
    var titleFiveValue:String!
    var titleSix:String!
    var titleSixValue:String!
    
    init(
        typeImage:String? = nil,titleOne: String? = nil,
        titleOneValue:String? = nil,titleTwo:String? = nil,
        titleTwoValue: String? = nil,titleThree:String? = nil,
        titleThreeValue: String? = nil,titleFour:String? = nil,
        titleFourValue: String? = nil,titleFive:String? = nil,
        titleFiveValue: String? = nil,titleSix:String? = nil,
        titleSixValue: String? = nil
         ) {
        self.typeImage = typeImage
        self.titleOne = titleOne
        self.titleOneValue = titleOneValue
        self.titleTwo = titleTwo
        self.titleTwoValue = titleTwoValue
        self.titleThree = titleThree
        self.titleThreeValue = titleThreeValue
        self.titleFour = titleFour
        self.titleFourValue = titleFourValue
        self.titleFive = titleFive
        self.titleFiveValue = titleFiveValue
        self.titleSix = titleSix
        self.titleSixValue = titleSixValue
    }
    
    init?(dic:NSDictionary) {
        
        let typeImage = (dic as AnyObject).value(forKey: Constant.typeImage) as? String
        let titleOne = (dic as AnyObject).value(forKey: Constant.titleOne) as! String
        let titleOneValue = (dic as AnyObject).value(forKey: Constant.titleOneValue) as? String
        
        let titleTwo = (dic as AnyObject).value(forKey: Constant.titleTwo) as? String
        let titleTwoValue = (dic as AnyObject).value(forKey: Constant.titleTwoValue) as! String
        let titleThree = (dic as AnyObject).value(forKey: Constant.titleThree) as? String
        
        let titleThreeValue = (dic as AnyObject).value(forKey: Constant.titleThreeValue) as? String
        let titleFour = (dic as AnyObject).value(forKey: Constant.titleFour) as! String
        let titleFourValue = (dic as AnyObject).value(forKey: Constant.titleFourValue) as? String
        
        let titleFive = (dic as AnyObject).value(forKey: Constant.titleFive) as? String
        let titleFiveValue = (dic as AnyObject).value(forKey: Constant.titleFiveValue) as? String
        let titleSix = (dic as AnyObject).value(forKey: Constant.titleSix) as? String
        let titleSixValue = (dic as AnyObject).value(forKey: Constant.titleSixValue) as? String
        
        self.typeImage = typeImage
        self.titleOne = titleOne
        self.titleOneValue = titleOneValue
        
        self.titleTwo = titleTwo
        self.titleTwoValue = titleTwoValue
        self.titleThree = titleThree
        
        self.titleThreeValue = titleThreeValue
        self.titleFour = titleFour
        self.titleFourValue = titleFourValue
        
        self.titleFive = titleFive
        self.titleFiveValue = titleFiveValue
        self.titleSix = titleSix
        self.titleSixValue = titleSixValue
        
    }
}
