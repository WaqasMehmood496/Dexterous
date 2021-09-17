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

extension FilesController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageColleciton.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FileCollectionViewCell", for: indexPath) as! FileCollectionViewCell
        cell.FileImage.image = UIImage(named: imageColleciton[indexPath.row])
        return cell
    }
    
    
}
