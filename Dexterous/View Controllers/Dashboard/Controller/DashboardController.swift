//
//  DashboardController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 14/09/2021.
//

import UIKit
import SideMenu

class DashboardController: UIViewController {
    
    //IBOUTLET
    @IBOutlet weak var DashboardTableView: UITableView!
    
    //CONSTANTS
    
    var attrs = [
        NSAttributedString.Key.underlineStyle : 1
    ]
    
    let myTasks = [
        MyTaskModel(taskName: "Write Blog", assignBy: "Jon", due: "8/10"),
        MyTaskModel(taskName: "Write Blog", assignBy: "Jon", due: "8/10"),
        MyTaskModel(taskName: "Write Blog", assignBy: "Jon", due: "8/10")
    ]
    
    let projects = [
        ProjectsModel(projectName: "Project 1", progressValue: "0.5", progressPercentage: "80%"),
        ProjectsModel(projectName: "Project 2", progressValue: "0.8", progressPercentage: "80%")
    ]
    
    let media = MediaModel(images: ["Group 11730","Group 11730","Group 11730","Group 11730","Group 11730","Group 11730"])
    
    let mediaType = [
        MediaTypeModel(typeImage: "Web", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        MediaTypeModel(typeImage: "Web", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        MediaTypeModel(typeImage: "Web", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        MediaTypeModel(typeImage: "Web", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        MediaTypeModel(typeImage: "Web", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
    ]
    //VARIABLES
    var dashBoardData: DashboardModel = DashboardModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dashBoardData = DashboardModel(myTask: myTasks, projects: projects, media: media, mediaType: mediaType)
        self.DashboardTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //IBACTIONS
    @IBAction func MenuBtnAction(_ sender: UIButton) {
        let menu = storyboard!.instantiateViewController(withIdentifier: "RightMenu") as! SideMenuNavigationController
        present(menu, animated: true, completion: nil)
    }
}


//MARK:- HELPING METHODS
extension DashboardController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


//MARK:- UITABLEVIEW DELEGATE AND DATASOURCE METHOD'S
extension DashboardController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TABLEVIEW SECTION METHODS
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = Bundle.main.loadNibNamed("DashboardHeader", owner: self, options: nil)?.first as! DashboardHeader
        if section == 0{
            view.HeaderLabel.text = "My Task"
            view.HeaderButton.tag = section
            
            let buttonTitleStr = NSMutableAttributedString(string:"All Tasks", attributes:attrs)
            let attributedString = NSMutableAttributedString(string:"")
            attributedString.append(buttonTitleStr)
            view.HeaderButton.setAttributedTitle(attributedString, for: .normal)
            
            view.HeaderButton.addTarget(self, action: #selector(HeaderViewAllBtnAction(_:)), for: .touchUpInside)
            
        } else if section == 1 {
            view.HeaderLabel.text = "Projects"
            view.HeaderButton.tag = section
            view.HeaderButton.addTarget(self, action: #selector(HeaderViewAllBtnAction(_:)), for: .touchUpInside)
            
            let buttonTitleStr = NSMutableAttributedString(string:"All Files", attributes:attrs)
            let attributedString = NSMutableAttributedString(string:"")
            attributedString.append(buttonTitleStr)
            view.HeaderButton.setAttributedTitle(attributedString, for: .normal)
            
        } else if section == 2 {
            view.HeaderLabel.text = "Media"
            view.HeaderButton.tag = section
            view.HeaderButton.addTarget(self, action: #selector(HeaderViewAllBtnAction(_:)), for: .touchUpInside)
            let buttonTitleStr = NSMutableAttributedString(string:"All Files", attributes:attrs)
            let attributedString = NSMutableAttributedString(string:"")
            attributedString.append(buttonTitleStr)
            view.HeaderButton.setAttributedTitle(attributedString, for: .normal)
            
        }  else if section == 3 {
            //Hide Media Detail Header
        } else if section == 4 {
            view.HeaderLabel.text = "Next Step"
            view.HeaderButton.setTitle("", for: .normal)
            view.HeaderButton.isHidden = true
        } else {
            let footerHeader = Bundle.main.loadNibNamed("DashboardFooter", owner: self, options: nil)?.first as! DashboardFooterHeader
            footerHeader.SeeAllWorkBtn.tag = section
            
            let buttonTitleStr = NSMutableAttributedString(string:"See All Work", attributes:attrs)
            let attributedString = NSMutableAttributedString(string:"")
            attributedString.append(buttonTitleStr)
            
            footerHeader.SeeAllWorkBtn.setAttributedTitle(attributedString, for: .normal)
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
    
    
    //MARK: TABLEVIEW ROW METHODS
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
        if indexPath.section == 3 {
            MoveToNextVC(identifier: "MediaTypeController")
        }
    }
}


//MARK:- TABLEVIEW OBSERVERS AND HELPING METHOD'S
extension DashboardController {
    
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
            return cell
        }
    }
    
    func setupProjectsCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardProjectsCell", for: indexPath) as! DashboardProjectsCell
        clearCellSelectionColor(cell: cell)
        cell.ProjectNameLabel.text = self.dashBoardData.projects[indexPath.row].projectName
        cell.ProjectProgress.progress = Float(self.dashBoardData.projects[indexPath.row].progressValue)!
        cell.ProgressValueLabel.text = self.dashBoardData.projects[indexPath.row].progressPercentage
        return cell
    }
    
    func setupMediaCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMediaCell", for: indexPath) as! DashboardMediaCell
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func setupMediaTypeCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMediaTypeCell", for: indexPath) as! DashboardMediaTypeCell
        clearCellSelectionColor(cell: cell)
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
        
        if indexPath.row == 0 {
            cell.MediaTypeIcon.image = #imageLiteral(resourceName: "Web")
            cell.UpperBar.backgroundColor = UIColor(named:"Orange")
        } else if indexPath.row == 1 {
            cell.MediaTypeIcon.image = #imageLiteral(resourceName: "Seo")
            cell.UpperBar.backgroundColor = UIColor(named:"Pink")
        } else if indexPath.row == 2 {
            cell.MediaTypeIcon.image = #imageLiteral(resourceName: "Vid")
            cell.UpperBar.backgroundColor = UIColor(named:"Green")
        } else if indexPath.row == 3 {
            cell.MediaTypeIcon.image = #imageLiteral(resourceName: "Social")
            cell.UpperBar.backgroundColor = UIColor(named:"Color")
        } else {
            cell.MediaTypeIcon.image = #imageLiteral(resourceName: "Auto")
            cell.UpperBar.backgroundColor = UIColor(named:"Purple")
        }
        return cell
    }
    
    func setupNextStepCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NextStepCell", for: indexPath) as! DashboardNextStepCell
        cell.GetStartedBtn.addTarget(self, action: #selector(GetStartedBtnAction(_:)), for: .touchUpInside)
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func setupFooterCell(tableView:UITableView,indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardFooterCell", for: indexPath) as! DashboardFooterCell
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
    //OBSERVERS
    @objc func HeaderViewAllBtnAction (_ sender:UIButton) {
        print("View All Btn Pressed")
    }
    
    @objc func GetStartedBtnAction (_ sender:UIButton) {
        print("View All Btn Pressed")
        MoveToNextVC(identifier: "MediaTypePurchasingController")
    }
    
    //HEADER OBSERVERS
    @objc func SeeAllWorkBtnAction (_ sender:UIButton) {
        MoveToNextVC(identifier: "AllProjectsController")
    }
    
}
