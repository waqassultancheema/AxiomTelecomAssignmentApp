//
//  CategoryCollectionView.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan Home on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit

class CategoryCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    override func awakeFromNib() {
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    
    

}
