//
//  DashboardNextStepCollectionView.swift
//  Dexterous
//
//  Created by Buzzware Tech on 22/09/2021.
//

import Foundation
import UIKit

extension DashboardController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnCompleteMediaCollectionViewCell", for: indexPath) as! UnCompleteMediaCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompletedMediaCollectionViewCell", for: indexPath) as! CompletedMediaCollectionViewCell
            return cell
        }
    }
}
