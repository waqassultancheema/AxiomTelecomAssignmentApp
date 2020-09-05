//
//  MobileCatalogsPresenterTests.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import AxiomTelecomAssignment

class MobileCatalogsPresenterTests: XCTestCase {

    var stubMobileCatalogs:[StubMobileCatalogElement]?
    var sutPres:MobileCatalogsPresenter?

    override func setUp() {
        super.setUp()
        stubMobileCatalogs = [StubMobileCatalogElement.dummyMobileCatalogElement()]
        sutPres = MobileCatalogsPresenter()
    }
    
    
    func testPresentMobileCatalogsShouldFormatPostForDisplay() {
        
        let sutMobileCatalogsViewController:StubMobileCatalogsViewController = StubMobileCatalogsViewController()
        sutMobileCatalogsViewController.configureCatalogCollectionViewDataSource()
        sutPres?.output = sutMobileCatalogsViewController
        sutPres?.presentFetchMobileCatalogs(mobileCatalogs: stubMobileCatalogs ?? [], categories: [])
        let mobileCatalog = sutMobileCatalogsViewController.collectionViewDataSource.mobileCatalogs.first
        XCTAssertNotNil(mobileCatalog)
    }

    


}
