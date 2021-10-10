//
//  DashboardTableView.swift
//  Dexterous
//
//  Created by Buzzware Tech on 22/09/2021.
//

import Foundation
import UIKit

//MARK: TABLEVIEW SECTION METHODS
extension DashboardController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = Bundle.main.loadNibNamed("DashboardHeader", owner: self, options: nil)?.first as! DashboardHeader
        if section == 0{
            view.HeaderLabel.text = "My Tasks"
            view.HeaderButton.tag = section
            addUnderLineOnButtonText(button: view.HeaderButton, text: "All Tasks")
            view.HeaderButton.addTarget(self, action: #selector(HeaderViewAllBtnAction(_:)), for: .touchUpInside)
            
        } else if section == 1 {
            view.HeaderLabel.text = "Projects"
            view.HeaderButton.tag = section
            view.HeaderButton.addTarget(self, action: #selector(HeaderViewAllBtnAction(_:)), for: .touchUpInside)
            view.HeaderButton.isHidden = true
        } else if section == 2 {
            view.HeaderLabel.text = "Media"
            view.HeaderButton.tag = section
            view.HeaderButton.addTarget(self, action: #selector(HeaderViewAllBtnAction(_:)), for: .touchUpInside)
            addUnderLineOnButtonText(button: view.HeaderButton, text: "All Files")
        }  else if section == 3 {
            //Hide Media Detail Header
        } else if section == 4 {
            view.HeaderLabel.text = "Next Step"
            view.HeaderButton.setTitle("", for: .normal)
            view.HeaderButton.isHidden = true
        } else {
            let footerHeader = Bundle.main.loadNibNamed("DashboardFooter", owner: self, options: nil)?.first as! DashboardFooterHeader
            footerHeader.SeeAllWorkBtn.tag = section
            addUnderLineOnButtonText(button: footerHeader.SeeAllWorkBtn, text: "See All Work")
            footerHeader.SeeAllWorkBtn.addTarget(self, action: #selector(SeeAllWorkBtnAction(_:)), for: .touchUpInside)
            
            return footerHeader
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3 {
            return 0
        } else {
            return 50
        }
    }
    
}



//MARK: TABLEVIEW ROW METHODS
extension DashboardController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.dashBoardData.myTask.count + 1
        } else if section == 1 {
            return self.dashBoardData.projects.count
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return self.dashBoardData.mediaType.count
        } else if section == 4 {
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let myTaskCell = setupTaskCell(tableView: tableView, indexPath: indexPath)
            return myTaskCell
        } else if indexPath.section == 1 {
            let myProjectsCell = setupProjectsCell(tableView: tableView, indexPath: indexPath)
            return myProjectsCell
        } else if indexPath.section == 2 {
            let mediaCell = setupMediaCell(tableView: tableView, indexPath: indexPath)
            return mediaCell
        } else if indexPath.section == 3 {
            let mediaTypeCell = setupMediaTypeCell(tableView: tableView, indexPath: indexPath)
            return mediaTypeCell
        } else if indexPath.section == 4 {
            let nextStepCell = setupNextStepCell(tableView: tableView, indexPath: indexPath)
            return nextStepCell
        } else {
            let footerCell = setupFooterCell(tableView: tableView, indexPath: indexPath)
            return footerCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            // When single task is selected move to task detail screen
            if indexPath.row != 0{
                MoveToNextVC(identifier: "AllProjectsController")
            }
        } else if indexPath.section == 1 {
            MoveToNextVC(identifier: "ProjectCompleteDetailController")
        } else if indexPath.section == 3 {
            if UserDefaults.standard.bool(forKey: Constant.userSkipTheLogin) == false {
                MoveToNextVC(identifier: "MediaTypeController")
            }
        }
    }
}




//MARK:- TABLEVIEW ROW SUB METHODS
extension DashboardController {
    
    //MARK: TASK
    func setupTaskCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMyTaskHeadingCell", for: indexPath)
            clearCellSelectionColor(cell: cell)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMyTaskCell", for: indexPath) as! DashboardMyTaskCell
            clearCellSelectionColor(cell: cell)
            cell.TaskNameLabel.text = self.dashBoardData.myTask[indexPath.row - 1].taskName
            cell.AssignByLabel.text = self.dashBoardData.myTask[indexPath.row - 1].assignBy
            cell.DueLabel.text = self.dashBoardData.myTask[indexPath.row - 1].due
            if indexPath.row == self.dashBoardData.myTask.count {
                cell.DueLabel.textColor = UIColor.red
            }
            return cell
        }
    }
    
    //MARK: PROJECT
    func setupProjectsCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardProjectsCell", for: indexPath) as! DashboardProjectsCell
        clearCellSelectionColor(cell: cell)
        cell.ProjectNameLabel.text = self.dashBoardData.projects[indexPath.row].projectName
        cell.ProjectProgress.progress = Float(self.dashBoardData.projects[indexPath.row].progressValue)!
        cell.ProgressValueLabel.text = self.dashBoardData.projects[indexPath.row].progressPercentage
        cell.ProjectProgress.progressTintColor = UIColor(named: self.dashBoardData.projects[indexPath.row].progressColor)
        return cell
    }
    
    //MARK: MEDIA
    func setupMediaCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMediaCell", for: indexPath) as! DashboardMediaCell
        cell.MediaImagesCollection.tag = indexPath.row
        cell.firstSectionItems = self.imageColleciton
        cell.loadData()
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    //MARK: MEDIA TYPE
    func setupMediaTypeCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMediaTypeCell", for: indexPath) as! DashboardMediaTypeCell
        
        cell.MediaTitle.text = self.dashBoardData.mediaType[indexPath.row].title
        cell.HeadingOneLabel.text = self.dashBoardData.mediaType[indexPath.row].titleOne
        cell.HeadingTwoLabel.text = self.dashBoardData.mediaType[indexPath.row].titleTwo
        cell.HeadingThreeLabel.text = self.dashBoardData.mediaType[indexPath.row].titleThree
        cell.HeadingFourLabel.text = self.dashBoardData.mediaType[indexPath.row].titleFour
        cell.HeadingFiveLabel.text = self.dashBoardData.mediaType[indexPath.row].titleFive
        cell.HeadingSixLabel.text = self.dashBoardData.mediaType[indexPath.row].titleSix
        
        cell.HeadingOneValue.text = self.dashBoardData.mediaType[indexPath.row].titleOneValue
        cell.HeadingTwoValue.text = self.dashBoardData.mediaType[indexPath.row].titleTwoValue
        cell.HeadingThreeValue.text = self.dashBoardData.mediaType[indexPath.row].titleThreeValue
        cell.HeadingFourValue.text = self.dashBoardData.mediaType[indexPath.row].titleFourValue
        cell.HeadingFiveValue.text = self.dashBoardData.mediaType[indexPath.row].titleFiveValue
        cell.HeadingSixValue.text = self.dashBoardData.mediaType[indexPath.row].titleSixValue
        
        cell.FaceboolBtn.tag = indexPath.row
        cell.FaceboolBtn.addTarget(self, action: #selector(MediaFacebookBtnAction(_:)), for: .touchUpInside)
        
        //Set Color according cell
        changeMediaTypeColor(cell: cell, image: self.dashBoardData.mediaType[indexPath.row].typeImage, theamColor: self.dashBoardData.mediaType[indexPath.row].color)
        
        if self.dashBoardData.mediaType[indexPath.row].title == "Social Media" {
            cell.MediaStackView.isHidden = false
        } else {
            cell.MediaStackView.isHidden = true
        }
        
        hideShadedView(cell: cell, indexpath: indexPath)
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    //MARK: NEXT STEP
    func setupNextStepCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NextStepCell", for: indexPath) as! DashboardNextStepCell
        cell.GetStartedBtn.addTarget(self, action: #selector(GetStartedBtnAction(_:)), for: .touchUpInside)
        clearCellSelectionColor(cell: cell)
        cell.WhyVideoBtn.addTarget(self, action: #selector(WhyVideoBtnAction(_:)), for: .touchUpInside)
        cell.NextStepMediaCollection.delegate = self
        cell.NextStepMediaCollection.dataSource = self
        
        return cell
    }
    
    //MARK: FOOTER
    func setupFooterCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardFooterCell", for: indexPath) as! DashboardFooterCell
        cell.ItemLabel.text = self.dashBoardData.myTask[indexPath.row].taskName
        
        clearCellSelectionColor(cell: cell)
        return cell
    }
}


//MARK:- UITABLEVIEW HELPING METHOD'S
extension DashboardController {
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
    func addUnderLineOnButtonText(button:UIButton, text:String) {
        let buttonTitleStr = NSMutableAttributedString(string:text, attributes:attrs)
        let attributedString = NSMutableAttributedString(string:"")
        attributedString.append(buttonTitleStr)
        button.setAttributedTitle(attributedString, for: .normal)
    }
    
    func changeMediaTypeColor(cell:DashboardMediaTypeCell, image:String, theamColor:String) {
        cell.MediaTypeIcon.image = UIImage(named: image)
        cell.UpperBar.backgroundColor = UIColor(named:theamColor)
        cell.RectangleView.borderColor = UIColor(named:theamColor)
        cell.CrossBtn.tintColor = UIColor(named: theamColor)
        cell.MediaTitle.textColor = UIColor(named: theamColor)
    }
    
    func hideShadedView(cell:DashboardMediaTypeCell,indexpath:IndexPath) {
        //Hide Media type shade view
        //if indexpath.row == self.dashBoardData.mediaType.count {
        if UserDefaults.standard.bool(forKey: Constant.userSkipTheLogin) {
            cell.BackShadeView.isHidden = false
        } else {
            cell.BackShadeView.isHidden = true
        }
    }
}

//MARK:- UITABLEVIEW BUTTONS OBSERVER'S
extension DashboardController {
    
    @objc func HeaderViewAllBtnAction (_ sender:UIButton) {
        switch sender.tag {
        case 0:
            self.tabBarController?.selectedIndex = 1
        case 1:
            break
        case 2:
            MoveToNextVC(identifier: "FilesController")
        default:
            break
        }
    }
    
    @objc func GetStartedBtnAction (_ sender:UIButton) {
        print("View All Btn Pressed")
        let pricingPage = self.getViewController(identifier: "MediaTypePurchasingController") as! MediaTypePurchasingController
        pricingPage.product = ProductModel(
            mediaType: "Video", mediaLogo: "Vid", mediaColor: "Green", produtsTypes: [
                ProductTypesModel(title: "Get Started", price: "$1500", benifit: ["5 Keywords","1 Blog per month","On-site SEO: included such as SCHEMA Markup link structure, meta More"])
            ])
        
        self.navigationController?.pushViewController(pricingPage, animated: true)
    }
    
    //HEADER OBSERVERS
    @objc func SeeAllWorkBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "AllProjectsController")
    }
    
    @objc func WhyVideoBtnAction(_ sender:UIButton) {
        MoveToNextVC(identifier: "WhyVideoViewController")
    }
    
    @objc func MediaFacebookBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "MediaCalenderViewController")
    }
}
