//
//  DashboardMediaCell.swift
//  Dexterous
//
//  Created by Buzzware Tech on 15/09/2021.
//

import UIKit
import collection_view_layouts

enum LayoutType: Int {
    case tags
    case pinterest
    case px500
    case instagram
    case flipboard
    case facebook
    case flickr
}

class DashboardMediaCell: UITableViewCell, LayoutDelegate {
    
    //MARK:- IBAddTaskViewControllerOUTLET'S
    @IBOutlet weak var MediaImagesCollection: UICollectionView!
    @IBOutlet weak var FacebookBtn: UIButton!
    @IBOutlet weak var FacebookBatchNumberLabel: UILabel!
    @IBOutlet weak var YoutubeBtn: UIButton!
    @IBOutlet weak var YoutubeBatchNumberLabel: UILabel!
    @IBOutlet weak var LinkedInBtn: UIButton!
    @IBOutlet weak var LinkedInBatchNumberLabel: UILabel!
    @IBOutlet weak var InstagramBtn: UIButton!
    @IBOutlet weak var InstagramBatchNumberLabel: UILabel!
    @IBOutlet weak var TwitterBtn: UIButton!
    @IBOutlet weak var TwitterBatchNumberLabel: UILabel!
    @IBOutlet weak var WebBtn: UIButton!
    @IBOutlet weak var WebBatchNumberLabel: UILabel!
    
    private let collectionViewProvider = CollectionViewProvider()
    private var cellSizes = [[CGSize]]()
    var layout: BaseLayout!
    var firstSectionItems = ["one", "two", "three"]
    var secondSectionItems = ["activity", "appstore", "calculator"]
    var items = [[String]]()
    var supplementaryItems = ["numbers"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.loadData()
    }
    
    func loadData(){
        self.items = [firstSectionItems]
        prepareCellSizes(withType: .flipboard)
        showLayout(withType: .flipboard)
        MediaImagesCollection.dataSource = collectionViewProvider
        collectionViewProvider.items = items
        //collectionViewProvider.mediaGalleryDelegate = self
        collectionViewProvider.supplementaryItems = supplementaryItems
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func cellSize(indexPath: IndexPath) -> CGSize {
        return cellSizes[indexPath.section][indexPath.row]
    }
    
    private func prepareCellSizes(withType type: LayoutType) {
        let range = 50...150
        cellSizes.removeAll()
        
        collectionViewProvider.items.forEach { items in
            let sizes = items.map { item -> CGSize in
                switch type {
                case .tags:
                    let width = Double(self.MediaImagesCollection.bounds.width)
                    var size = UIFont.systemFont(ofSize: 17).sizeOfString(string: item, constrainedToWidth: width)
                    size.width += 30
                    size.height += 20
                    return size
                case .pinterest:
                    let height = CGFloat(Int.random(in: range))
                    return CGSize(width: 0.1, height: height)
                case .px500:
                    let width = CGFloat(Int.random(in: range))
                    let height = CGFloat(Int.random(in: range))
                    return CGSize(width: width, height: height)
                default:
                    return CGSize(width: 0.1, height: 0.1)
                }
            }
            
            cellSizes.append(sizes)
        }
    }
    private func showLayout(withType type: LayoutType) {
        switch type {
        case .tags:
            layout = TagsLayout()
        // Tags layout supports next configs
        // layout.contentAlign = .right
        // layout.scrollDirection = .horizontal
        case .pinterest:
            layout = PinterestLayout()
        // Pinterest layout supports next configs
        // layout.columnsCount = 3
        case .px500:
            layout = Px500Layout()
        // 500px layout supports next configs
        // layout.minCellsInRow = .two
        // layout.maxCellsInRow = .two
        // layout.visibleRowsCount = 6
        case .instagram:
            layout = InstagramLayout()
        // Instagram layout supports next configs
        // layout.gridType = .onePreviewCell
        case .flipboard:
            layout = FlipboardLayout()
        // Flipboard layout supports next configs
        // layout.contentAlign = .right
        case .facebook:
            layout = FacebookLayout()
        case .flickr:
            layout = FlickrLayout()
        }
        
        layout.delegate = self
        
        // All layouts support this configs
        layout.contentPadding = ItemsPadding(horizontal: 4, vertical: 4)
        layout.cellsPadding = ItemsPadding(horizontal: 4, vertical: 4)
        
        MediaImagesCollection.collectionViewLayout = layout
        MediaImagesCollection.setContentOffset(CGPoint.zero, animated: false)
        MediaImagesCollection.reloadData()
    }
    
}
class CollectionViewProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    var items = [[String]]()
    var supplementaryItems = [String]()
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return supplementaryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilesCollectionViewCell", for: indexPath)
        
        if let cell = cell as? FilesCollectionViewCell {
            let item = items[indexPath.section][indexPath.row]
            cell.FileImage.image = UIImage(named: item)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}
