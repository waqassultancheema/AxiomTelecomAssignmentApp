//
//  StubMobileCatalogsPresenter.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import AxiomTelecomAssignment

class StubMobileCatalogsPresenter: MobileCatalogsPresenter {

    var presentFetchedMobileCatalogsCalled = false
    

    override func presentFetchMobileCatalogs(mobileCatalogs: MobileCatalogs, categories: [String]) {
        super.presentFetchMobileCatalogs(mobileCatalogs: mobileCatalogs, categories: categories)
        presentFetchedMobileCatalogsCalled  = true

    }
   
    

}
