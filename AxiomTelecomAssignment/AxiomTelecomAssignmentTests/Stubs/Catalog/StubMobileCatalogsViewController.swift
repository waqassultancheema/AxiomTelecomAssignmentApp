//
//  StubMobileCatalogsViewController.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit
@testable import AxiomTelecomAssignment

class StubMobileCatalogsViewController: MobileCatalogsViewController {

    
    
    var error:String = ""
    
    override func viewDidLoad() {
        
    }
    
    override func configureCatalogCollectionViewDataSource(collectionViewDataSource: MobileCatalogsCollectionViewDataSource = MobileCatalogsCollectionViewDataSource()) {
        self.collectionViewDataSource = collectionViewDataSource

    }
    
    override func displayFetchMobileCatalogs(viewModel: DisplayViewModel) {
        self.collectionViewDataSource.mobileCatalogs = viewModel.mobileCatalogs
    }
    
    override func errorMobileCatalogs(error: String) {
        self.error = error
        self.view.stopActivityIndicator()

    }


}
