//
//  MobileCatalogsRemoteWorkerTests.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import AxiomTelecomAssignment

class MobileCatalogsRemoteWorkerTests: XCTestCase {
    
    var sut:MobileCatalogsRemoteWorker?
    //var sutMobileCatalogsViewController:StubMobileCatalogsViewController?
    var jsonMobileCatalogssDictionaryStub : Array<Dictionary<String, AnyObject>>!
    var stubSerivceApi:StubServiceApi = StubServiceApi()
    override func setUp() {
        super.setUp()
        jsonMobileCatalogssDictionaryStub = loadJSONDictionaryFromBundle(withName: "MobileCatalogs", extension: "json")
        
        sut = MobileCatalogsRemoteWorker()
        stubSerivceApi.session = StubURLSession()
        sut?.serviceApi = stubSerivceApi
        
        
    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonMobileCatalogssDictionaryStub)
    }
    
    
    
    
    func testShouldReturnMobileCatalogs() {
        DummyReachability.isConnected = true
        
        let jsonString:String = jsonMobileCatalogssDictionaryStub.jsonStringRepresentation!
        let session = stubSerivceApi.session as! StubURLSession
        session.nextData = jsonString.data(using: .utf8)
        let request = Request.Fetch.MobileCatalogRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        
        sut?.fetchMobileCatalogs(request: request, complete: { (mobileCatalog) in
            XCTAssertNotNil(mobileCatalog)
            
        }, failure: { (error) in
            XCTFail()
            
        })
        
        
    }
    
    func testShouldReturnErrorOfMappingMobileCatalogs() {
        DummyReachability.isConnected = true
        let session = stubSerivceApi.session as! StubURLSession
        
        session.nextData = "ccc".data(using: .utf8)
        let request = Request.Fetch.MobileCatalogRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        sut?.fetchMobileCatalogs(request: request, complete: { (mobileCatalog) in
            XCTFail()
            
        }, failure: { (error) in
            XCTAssertEqual(error, "The data couldn’t be read because it isn’t in the correct format.")
            
        })
        
    }
}
