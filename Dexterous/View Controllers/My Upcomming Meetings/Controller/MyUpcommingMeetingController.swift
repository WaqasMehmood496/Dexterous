//
//  MyUpcommingMeetingController.swift
//  Dexterous
//
//  CrAllProjectsControllereated by Buzzware Tech on 16/09/2021.
//

import UIKit

class MyUpcommingMeetingController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var MetingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

//MARK:- UITABLEVIEW DELEGATE AND DATASOURCE
extension MyUpcommingMeetingController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeetingTableViewCell", for: indexPath) as! MeetingTableViewCell
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
    
    
}
