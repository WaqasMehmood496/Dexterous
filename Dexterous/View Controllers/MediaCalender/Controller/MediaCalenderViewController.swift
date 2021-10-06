//
//  MediaCalenderViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit
import FSCalendar

class MediaCalenderViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var mediaTablciew: UITableView!
    @IBOutlet weak var MediaCalander: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MediaCalander.appearance.weekdayTextColor = UIColor(named: "Black Text Color")
        MediaCalander.appearance.todaySelectionColor = .white
        MediaCalander.appearance.borderSelectionColor = .black
        MediaCalander.appearance.todayColor = UIColor.cyan
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.freeTrailPopUp()
    }
    
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func ScheduleNewPost(_ sender: UIButton) {
        MoveToNextVC(identifier: "SCNewPOSTViewController")
    }
}

//MARK: - HELPING METHOD'S
extension MediaCalenderViewController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


extension MediaCalenderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediacalender1TableViewCell") as! mediacalender1TableViewCell
        clearCellSelectionColor(cell: cell)
        return cell
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }
}

extension FSCalendar {
    var borders: [UIView] {
        guard let bottomBorder = value(forKey: "bottomBorder") as? UIView,
              let topBorder = value(forKey: "topBorder") as? UIView else { return [] }
        return [topBorder, bottomBorder]
    }
}

