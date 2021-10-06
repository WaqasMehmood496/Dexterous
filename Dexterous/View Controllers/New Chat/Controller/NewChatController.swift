//
//  NewChatController.swift
//  Dexterous
//
//  Created by Mac on 02/10/2021.
//

import UIKit

class NewChatController: UIViewController {
    
    @IBOutlet weak var NewChatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NewChatController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewChatCell", for: indexPath) as! NewChatCell
        clearCellSelectionColor(cell:cell)
        return cell
    }
    
    func clearCellSelectionColor(cell:UITableViewCell) {
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
    }    
}
