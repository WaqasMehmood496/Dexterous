//
//  FilesTableViewCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 17/09/2021.
//

import UIKit
import collection_view_layouts

class FilesTableViewCell: UITableViewCell, LayoutDelegate {
    
    @IBOutlet weak var FilesCollectionView: UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout: BaseLayout = FlipboardLayout()
        layout.delegate = self
        layout.cellsPadding = ItemsPadding(horizontal: 4, vertical: 4)
        FilesCollectionView.collectionViewLayout = layout
        FilesCollectionView.reloadData()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func cellSize(indexPath: IndexPath) -> CGSize {
        return CGSize()
    }
    
}
