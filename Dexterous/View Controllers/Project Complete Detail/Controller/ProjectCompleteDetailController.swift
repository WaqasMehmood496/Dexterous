//
//  ProjectCompleteDetailController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 17/09/2021.
//

import UIKit

class ProjectCompleteDetailController: UIViewController {
    
    
    //IBOUTLET'S
    @IBOutlet weak var ProjectDetailTableView: UITableView!
    
    //VAIABLES
    let imageColleciton = [
        "maxresdefault-1","maxresdefault-5","maxresdefault","maxresdefault-1","maxresdefault-5","maxresdefault"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //IBACTION'S
    @IBAction func BackBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProjectCompleteDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 5
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectOverViewTableViewCell", for: indexPath) as! ProjectOverViewTableViewCell
            cell.ProjectInvitationsCollectionView.tag = 111
            cell.ProjectInvitationsCollectionView.delegate = self
            cell.ProjectInvitationsCollectionView.dataSource = self
            return cell
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AssignByCell", for: indexPath)
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TaskHeding", for: indexPath)
                return cell
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardMyTaskCell", for: indexPath) as! DashboardMyTaskCell
                return cell
            }
            
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilesTableViewCell", for: indexPath) as! FilesTableViewCell
            cell.tag = 1000
            cell.FilesCollectionView.delegate = self
            cell.FilesCollectionView.dataSource = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddACommentTableViewCell", for: indexPath) as! AddACommentTableViewCell
            return cell
        }
    }
    
    
}


extension ProjectCompleteDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 111{
            return 3
        } else {
            return imageColleciton.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 111 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InvitationsCollectionViewCell", for: indexPath) as! InvitationsCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilesCollectionViewCell", for: indexPath) as! FilesCollectionViewCell
            cell.FileImage.image = UIImage(named: imageColleciton[indexPath.row])
            return cell
        }
    }
    
}
