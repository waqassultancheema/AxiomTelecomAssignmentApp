//
//  MobileCatalogsInteractorTests.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import AxiomTelecomAssignment

class MobileCatalogsInteractorTests: XCTestCase {
    
    var sut: MobileCatalogsInteractor?
    var stubRemoteWorker:StubMobileCatalogsRemoteWorker?
    var sutMobileCatalogsViewController:StubMobileCatalogsViewController?
    override func setUp() {
        super.setUp()
        sut = MobileCatalogsInteractor()
        
        sutMobileCatalogsViewController = StubMobileCatalogsViewController()
        sutMobileCatalogsViewController?.configureCatalogCollectionViewDataSource()
      
        stubRemoteWorker = StubMobileCatalogsRemoteWorker()
        stubRemoteWorker?.dataToReturnOnSuccess = [StubMobileCatalogElement.dummyMobileCatalogElement()]

    }
    
    
    func testFetchMobileCatalogsShouldPresenterCalled() {
        
        
        
        let stubMobileCatalogsPresentation = StubMobileCatalogsPresenter()
        stubMobileCatalogsPresentation.output = sutMobileCatalogsViewController
        
        sut?.output = stubMobileCatalogsPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchItems(searchString: "", selectedCategory: "")
        
        XCTAssertTrue(stubMobileCatalogsPresentation.presentFetchedMobileCatalogsCalled, "")
    }
    
    func testFetchMobileCatalogsShouldAskPresenterToFormatResult() {
        
        
        
        let stubMobileCatalogsPresentation = StubMobileCatalogsPresenter()
        stubMobileCatalogsPresentation.output = sutMobileCatalogsViewController
        
        sut?.output = stubMobileCatalogsPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchItems(searchString: "", selectedCategory: "")
        let mobileCatalog = sutMobileCatalogsViewController?.collectionViewDataSource.mobileCatalogs.first
        XCTAssertNotNil(mobileCatalog)
    }
    
    func testFetchMobileCatalogsShouldReturnError() {
        
        
        
        let stubMobileCatalogsPresentation = StubMobileCatalogsPresenter()
        stubMobileCatalogsPresentation.output = sutMobileCatalogsViewController
        stubRemoteWorker?.shouldFailOnFetch = true
        sut?.output = stubMobileCatalogsPresentation
        sut?.worker = stubRemoteWorker
          sutMobileCatalogsViewController?.viewDidLoad()
        sut?.fetchItems(searchString: "", selectedCategory: "")
        XCTAssertNotNil(sutMobileCatalogsViewController?.error)
    }
    
    func testFetchMobileCatalogsShouldReturnMobileCatalogWithSearchString() {
        
        
        
        let stubMobileCatalogsPresentation = StubMobileCatalogsPresenter()
        stubMobileCatalogsPresentation.output = sutMobileCatalogsViewController
        sut?.output = stubMobileCatalogsPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchItems(searchString: "Apple", selectedCategory: "")
        let mobileCatalog = sutMobileCatalogsViewController?.collectionViewDataSource.mobileCatalogs.first
        XCTAssertNotNil(mobileCatalog)
    }
    
  
    
    func testFetchMobileCatalogsShouldReturnMobileCatalogWithWrongSearchString() {
        
        
        
        let stubMobileCatalogsPresentation = StubMobileCatalogsPresenter()
        stubMobileCatalogsPresentation.output = sutMobileCatalogsViewController
        sut?.output = stubMobileCatalogsPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchItems(searchString: "test2", selectedCategory: "")
        let mobileCatalog = sutMobileCatalogsViewController?.collectionViewDataSource.mobileCatalogs.first
        XCTAssertNil(mobileCatalog)
    }
    

}
