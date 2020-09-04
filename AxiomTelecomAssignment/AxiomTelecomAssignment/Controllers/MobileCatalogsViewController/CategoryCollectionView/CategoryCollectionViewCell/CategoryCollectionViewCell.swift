//
//  CategoryCollectionViewCell.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan Home on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    
    
    func bindData(categoryText: String, isSelected: Bool ) {
        self.categoryLabel.text = categoryText
        self.selectedView.isHidden = !isSelected
    }

}
