//
//  StubCollectionView.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

class StubCollectionView: UICollectionView {

    var isdequeueCalled = false
    var cell: UICollectionViewCell?
    
    
    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        isdequeueCalled = true
        return super.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    

}
