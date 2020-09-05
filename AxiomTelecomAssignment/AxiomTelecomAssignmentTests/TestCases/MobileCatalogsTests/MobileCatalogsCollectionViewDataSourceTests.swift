//
//  MobileCatalogsTableViewDataSourceTests.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import AxiomTelecomAssignment

class MobileCatalogsTableViewDataSourceTests: XCTestCase {

    var sut: MobileCatalogsCollectionViewDataSource!
    var mobileCatalogsViewController: StubMobileCatalogsViewController?
    var stubCollectionView: StubCollectionView?
    var stubWorker: StubMobileCatalogsRemoteWorker?
    override func setUp() {
        super.setUp()
        
        stubWorker = StubMobileCatalogsRemoteWorker()
        stubWorker?.dataToReturnOnSuccess = [StubMobileCatalogElement.dummyMobileCatalogElement()]
        
        mobileCatalogsViewController =  (UIStoryboard.viewController(screenName: "MobileCatalogsViewController", storyboardName: "Main") as! StubMobileCatalogsViewController)
        stubCollectionView = StubCollectionView(frame: CGRect(x: (mobileCatalogsViewController?.view.frame.origin.x)!, y: (mobileCatalogsViewController?.view.frame.origin.y)!, width: (mobileCatalogsViewController?.view.frame.size.width)!, height: (mobileCatalogsViewController?.view.frame.size.height)!), collectionViewLayout: UICollectionViewFlowLayout())
        mobileCatalogsViewController?.catalogCollectionView = stubCollectionView
        mobileCatalogsViewController?.viewDidLoad()
        sut = mobileCatalogsViewController?.collectionViewDataSource
        
        mobileCatalogsViewController?.configurator.interactor.worker = stubWorker
        mobileCatalogsViewController?.fetchMobileCatalogs()
    }
    
//    func testCellForIndexPath() {
//        
//        _ = sut?.collectionView(stubCollectionView!, cellForItemAt: IndexPath(row: 0, section: 0))
//        XCTAssertTrue(stubCollectionView!.isdequeueCalled)
//    }
//    
//    func testCellForNumberOfItems() {
//        
//        let row  = sut.collectionView(stubCollectionView!, numberOfItemsInSection: 0)
//        
//        XCTAssertTrue(row > 0)
//    }
    

    

}

