//
//  SkipNowController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit

class SkipNowController: UIViewController {
    
    //IBOUTLET
    @IBOutlet weak var TypeTableView: UITableView!
    
    //CONTANTS
    let typesArray = [
        "Sole Prop","Sole Prop","Sole Prop","Sole Prop","Sole Prop"
    ]
    let typeDescriptionArray = [
        "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business.",
        "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business.",
        "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business.",
        "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business.",
        "I am sole proprietor or a solely owned small business looking to jumpstart my business plan. I am looking for a markeeting partnership that can grow with my business."
    ]
    
    let servicesArray = ["Web","Seo","Vid","Social","Auto","Live"]
    //VARIABLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // IBACTION'S
    @IBAction func SignInBtnAction(_ sender: UIButton) {
        
    }
}


//MARK:- TYPES TABLEVIEW DELEGATE AND DATASOURCE
extension SkipNowController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypesTableViewCell", for: indexPath) as! TypesTableViewCell
        cell.TitleLabel.text = typesArray[indexPath.row]
        cell.DetailLabel.text = typeDescriptionArray[indexPath.row]
        
        let selecedView = UIView()
        selecedView.backgroundColor = .clear
        cell.selectedBackgroundView = selecedView
        
        return cell
    }
    
}

extension SkipNowController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
        cell.ServiceImage.image = UIImage(named: servicesArray[indexPath.row])
        return cell
    }
    
}
