//
//  CategoryCollectionView.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan Home on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit

protocol CategoryCollectionViewDelegate: class {
    func didSelect(model: String?)
}
class CategoryCollectionView: UICollectionView {
    
    var model: [String] = []
    var collectionViewDelegate: CategoryCollectionViewDelegate?
    var isSelectedIndex: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
        self.register(cellTypes: [CategoryCollectionViewCell.self])
    }

}
extension CategoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let collectionViewCell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        collectionViewCell.bindData(categoryText: model[indexPath.row], isSelected: indexPath.row == isSelectedIndex)
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.isSelectedIndex = indexPath.row
        self.collectionViewDelegate?.didSelect(model: model[indexPath.row])
        self.reloadData()
    }
    
}

extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


