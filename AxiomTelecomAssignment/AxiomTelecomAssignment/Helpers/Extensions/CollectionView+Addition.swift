//
//  CollectionView+Addition.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 05/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//
import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }
    func register(cellTypes: [UICollectionViewCell.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
}
extension UICollectionViewCell: ReusableView {}




