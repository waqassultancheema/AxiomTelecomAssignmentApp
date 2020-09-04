//
//  MobileCatalogsTableViewDataSource.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit


class MobileCatalogsCollectionViewDataSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource {
   
    var mobileCatalogs:[DisplayViewModel.MobileCatalogViewModel] = Array<DisplayViewModel.MobileCatalogViewModel>()

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mobileCatalogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionView: MobileCatalogsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MobileCatalogsCollectionViewCell", for: indexPath) as! MobileCatalogsCollectionViewCell
        collectionView.bindData(viewModel: mobileCatalogs[indexPath.row])
        return collectionView
    }
    
    
    
}


extension MobileCatalogsCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.0, height: 100)
    }
}
