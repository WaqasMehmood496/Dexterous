//
//  FilesController.swift
//  Dexterous
//
//  Created by Buzzware Tech on 17/09/2021.
//

import UIKit
import collection_view_layouts

class FilesController: UIViewController, LayoutDelegate {
    
    //IBOUTLET'S
    @IBOutlet weak var FilesCollectionView: UICollectionView!
    
    //CONSTANT'S
    let imageColleciton = [
        "maxresdefault-1","maxresdefault-5","maxresdefault"
    ]
    
    //VARIABLE'S
    private var cellSizes = [[CGSize]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: BaseLayout = FlipboardLayout()
        layout.delegate = self
        layout.cellsPadding = ItemsPadding(horizontal: 4, vertical: 4)
        FilesCollectionView.collectionViewLayout = layout
        FilesCollectionView.reloadData()
    }
    
    func cellSize(indexPath: IndexPath) -> CGSize {
        return CGSize()
    }
}



//MARK:- HELPING METHOD'S
extension FilesController {
    func MoveToNextVC(identifier:String)  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        self.present(controller, animated: true, completion: nil)
        //self.navigationController?.pushViewController(controller, animated: true)
    }
}



//MARK:- UICOLLECTION VIEW DELEGATE AND DATASOURCE METHOD'S
extension FilesController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageColleciton.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FileCollectionViewCell", for: indexPath) as! FileCollectionViewCell
        cell.FileImage.image = UIImage(named: imageColleciton[indexPath.row])
        cell.SelectionBtn.tag = indexPath.row
        cell.SelectionBtn.addTarget(self, action: #selector(selectionBtnAction(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func selectionBtnAction (_ sender: UIButton) {
        //self.MoveToNextVC(identifier: "AutoVCCViewController")
    }
    
}
