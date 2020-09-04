//
//  MobileCatalogsCollectionViewCell.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit
import Kingfisher

class MobileCatalogsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageviewThumbnail: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!

    

    func bindData(viewModel: DisplayViewModel.MobileCatalogViewModel) {
       
//        imageviewThumbnail.kf.setImage(with: URL(string: viewModel.picture))
//        self.labelTitle.text  = viewModel.brand
//        self.labelPrice.text = viewModel.price

    }
    
}
