//
//  MediaCalenderViewController.swift
//  Dexterous
//
//  Created by Macbook Air on 9/17/21.
//

import UIKit
import FSCalendar

class MediaCalenderViewController: UIViewController {

    @IBOutlet weak var mediaTablciew: UITableView!
    
    @IBOutlet weak var fsCaledner: FSCalendar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fsCaledner.headerHeight = 0.0
        fsCaledner.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesUpperCase
        fsCaledner.appearance.weekdayTextColor = UIColor(named: "Black Text Color")
        fsCaledner.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        fsCaledner.rowHeight = 100
        fsCaledner.appearance.borderRadius = 1
        fsCaledner.appearance.todaySelectionColor = .white
        fsCaledner.appearance.borderSelectionColor = .black
        //fsCaledner.appearance.
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true

    }
    


}
extension MediaCalenderViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediacalender1TableViewCell") as! mediacalender1TableViewCell
        return cell
    }
    
    
    
    
    
    
}
extension FSCalendar {
    var borders: [UIView] {
        guard let bottomBorder = value(forKey: "bottomBorder") as? UIView,
            let topBorder = value(forKey: "topBorder") as? UIView else { return [] }
        return [topBorder, bottomBorder]
    }
}

