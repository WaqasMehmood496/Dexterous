//
//  SearchUserController.swift
//  Dexterous
//
//  Created by Mac on 08/10/2021.
//

import UIKit

class SearchUserController: UIViewController {
    
    //OBOUTLET'S
    @IBOutlet weak var UserTableView: UITableView!
    
    //VARIABLE'S
    var userArray = [
        SearchUserModel(
            name: "Richard Mile", imageName: "Mask Group 375", isChecked: false
        ),
        SearchUserModel(
            name: "Richard Mile", imageName: "Mask Group 375", isChecked: false
        ),
        SearchUserModel(
            name: "Richard Mile", imageName: "Mask Group 375", isChecked: false
        ),
        SearchUserModel(
            name: "Richard Mile", imageName: "Mask Group 375", isChecked: false
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SearchUserController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.userArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchUserCell", for: indexPath) as! SearchUserCell
        
        cell.SelectionCheckBoxBtn.addTarget(self, action: #selector(SelectionCeheckBoxBtnAction(_:)), for: .touchUpInside)
        cell.SelectionCheckBoxBtn.tag = indexPath.row
        cell.SelectionCheckBoxBtn.setTitle("", for: .normal)
        return cell
        
    }
    
    @objc func SelectionCeheckBoxBtnAction (_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = self.UserTableView.cellForRow(at: indexPath) as! SearchUserCell
        
        if self.userArray[sender.tag].isChecked {
            cell.SelectionCheckBoxBtn.setImage(UIImage(named: ""), for: .normal)
        } else {
            cell.SelectionCheckBoxBtn.setImage(UIImage(named: "Icon awesome-check"), for: .normal)
        }
        self.userArray[sender.tag].isChecked = !self.userArray[indexPath.row].isChecked
        
    }
}
