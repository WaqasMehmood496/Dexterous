//
//  DashboardController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 14/09/2021.
//

import UIKit
import SideMenu
import collection_view_layouts
import RSSelectionMenu

class DashboardController: UIViewController {
    
    //IBOUTLET
    @IBOutlet weak var DashboardTableView: UITableView!
    
    //CONSTANTS
    
    let myTasks = [
        MyTaskModel(taskName: "Write Blog", assignBy: "Jon", due: "8/10"),
        MyTaskModel(taskName: "Design WebPage", assignBy: "Jon", due: "8/10"),
        MyTaskModel(taskName: "Plan Party", assignBy: "Jon", due: "8/10")
    ]
    
    let projects = [
        ProjectsModel(projectName: "Project 1", progressValue: "0.5", progressPercentage: "80%",progressColor: "Green"),
        ProjectsModel(projectName: "Project 2", progressValue: "0.8", progressPercentage: "80%", progressColor: "Orange")
    ]
    
    let imageColleciton = [
        "maxresdefault-1","maxresdefault-5","maxresdefault","maxresdefault-1","maxresdefault-5","maxresdefault"
    ]
    
    let media = MediaModel(images: ["Group 11730","Group 11730","Group 11730","Group 11730","Group 11730","Group 11730"])
    
    let mediaType = [
        MediaTypeModel(typeImage: "Web",title: "Website",color: "Orange", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        
        MediaTypeModel(typeImage: "Seo",title: "Seo",color: "Pink", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        
        MediaTypeModel(typeImage: "Vid", title: "Video",color: "Green", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        
        MediaTypeModel(typeImage: "Social", title: "Social Media",color: "Color", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        
        MediaTypeModel(typeImage: "Auto", title: "Connect",color: "Purple", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
        
        MediaTypeModel(typeImage: "Live", title: "Live Stream",color: "Gray", titleOne: "Avg. Visit Duration:", titleOneValue: "590", titleTwo: "Bounce Rate:", titleTwoValue: "0.656564", titleThree: "Page Per Visit:", titleThreeValue: "4.32", titleFour: "Total Visit:", titleFourValue: "256030000", titleFive: "Monthly Visit Estimate:", titleFiveValue: "229800000", titleSix: "", titleSixValue: ""),
    ]
    
    let simpleDataArray = ["Website", "Video", "Web"]
    let userAccountTempArray = [
        "Elizabeth Olsen 1",
        "Elizabeth Olsen 2",
        "Elizabeth Olsen 3",
        "Elizabeth Olsen 4"
    ]
    //VARIABLES
    
    var dashBoardData: DashboardModel = DashboardModel()
    var attrs = [
        NSAttributedString.Key.underlineStyle : 1
    ]
    var selectedDropDownValues = [String]()
    
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
    
    @IBAction func AddIconBtnAction(_ sender: Any) {
        let optionPopupVC = getViewController(identifier: "popviewViewController") as! popviewViewController
        optionPopupVC.array = ["Chat","Add Task","Upload File","New Project","Add/Remove Prople","Create a Team","Order Marketing","Cancel"]
        optionPopupVC.popUpFrom = .home
        optionPopupVC.dashBoardDelegate = self
        self.parent?.tabBarController?.present(optionPopupVC, animated: false, completion: nil)
    }
    
    @IBAction func YourComponyLogoDropdown(_ sender: UIButton) {
        //showYourComponyLogoDropdownMenu(sender: sender)
        showUserAccountBottomAlert()
    }
    
    @IBAction func ShowNotificationsButtonsAction(_ sender: UIButton) {
        MoveToNextVC(identifier: "NotificationViewController")
    }
}


//MARK:- HELPING METHODS
extension DashboardController {
    
    func showYourComponyLogoDropdownMenu(sender:UIButton) {
        
        let selectionMenu = RSSelectionMenu(dataSource: simpleDataArray) { (cell, item, indexPath) in
            cell.textLabel?.text = item
        }
        
        selectionMenu.setSelectedItems(items: selectedDropDownValues) { [weak self] (item, index, isSelected, selectedItems) in
            print(selectedItems)
        }
        
        selectionMenu.tableView?.showsVerticalScrollIndicator = false
        selectionMenu.tableView?.separatorStyle = .none
        selectionMenu.tableView?.borderColor = .clear
        
        selectionMenu.show(style: .popover(sourceView: sender, size: CGSize(width: 100, height: 100)), from: self)
    }
    
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showUserAccountBottomAlert() {
        let actionSheet = UIAlertController(title: nil, message: "Select your account", preferredStyle: .actionSheet)
        
        for userName in self.userAccountTempArray {
            let camera = UIAlertAction(title: userName, style: .default) { (action) in
             
            }
            //let cameraImage = UIImage(named: "icon_camera")
            //ucamera.setValue(cameraImage, forKey: "image")
            camera.setValue(0, forKey: "titleTextAlignment")
            camera.setValue(UIColor(named: "Button Black Bacground"), forKey: "titleTextColor")
            actionSheet.addAction(camera)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        cancel.setValue(UIColor(named: "Pink"), forKey: "titleTextColor")
        actionSheet.addAction(cancel)
       
        
        self.present(actionSheet, animated: true, completion: {
            print("completion block")
        })
    }
}



//MARK:- DASHBOARD DELEGATE METHOD'S
extension DashboardController {
    func moveToCreateProject() {
        self.MoveToNextVC(identifier: "StartAProjectController")
    }
    func moveToAddTask() {
        self.MoveToNextVC(identifier: "AddTaskViewController")
    }
}
