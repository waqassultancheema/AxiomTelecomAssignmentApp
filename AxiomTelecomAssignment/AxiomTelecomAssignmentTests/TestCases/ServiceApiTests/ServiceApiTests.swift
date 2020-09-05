//
//  ServiceApiTests.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import AxiomTelecomAssignment

class ServiceApiTests: XCTestCase {
    
    var sut:ServiceApi = ServiceApi()
    //var sutMobileCatalogsViewController:StubMobileCatalogsViewController?
    var jsonMobileCatalogssDictionaryStub : Array<Dictionary<String, AnyObject>>!
    let worker = MobileCatalogsRemoteWorker()
    
    override func setUp() {
        super.setUp()
        jsonMobileCatalogssDictionaryStub = loadJSONDictionaryFromBundle(withName: "MobileCatalogs", extension: "json")
        worker.serviceApi = sut
        sut.session = StubURLSession()
        
    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonMobileCatalogssDictionaryStub)
    }
    
    func testServiceNoInternetError() {
        DummyReachability.isConnected = false
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.MobileCatalogRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchMobileCatalogs(request: request, complete: { (mobile) in
           XCTFail()
        }) { (error) in
            XCTAssertNotNil(error)

        }
        
    }
    
    func testServiceResumeCalled() {
        DummyReachability.isConnected = true
        let request = Request.Fetch.MobileCatalogRequest()

        worker.fetchMobileCatalogs(request: request, complete: { (mobile) in
               }) { (error) in
               }
        
        
        XCTAssertTrue((sut.task as! StubURLSessionDataTask).resumeWasCalled)
        
    }
    
    
    func testShouldReturnCorrectResult() {
        DummyReachability.isConnected = true
        
        let jsonString:String = jsonMobileCatalogssDictionaryStub.jsonStringRepresentation!
        let session = sut.session as! StubURLSession
        session.nextData = jsonString.data(using: .utf8)
        let request = Request.Fetch.MobileCatalogRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchMobileCatalogs(request: request, complete: { (mobile) in
            XCTAssertNotNil(mobile)
        }, failure: { (error) in
            XCTFail()
        })
        
        
        
    }
    
    func testShouldReturnErrorOfNSURLErrorTimedOut() {
        DummyReachability.isConnected = true
        
        let jsonString:String = jsonMobileCatalogssDictionaryStub.jsonStringRepresentation!
        let session = sut.session as! StubURLSession
        session.nextData = jsonString.data(using: .utf8)
        let request = Request.Fetch.MobileCatalogRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: URLError.timedOut.rawValue , httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchMobileCatalogs(request: request, complete: { (mobile) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertNotNil(error)

        })
        
        
        
    }
    
    
    func testShouldReturnErrorWithDataNil() {
        DummyReachability.isConnected = true
        
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.MobileCatalogRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchMobileCatalogs(request: request, complete: { (mobile) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertNotNil(error)
            
        })
        
        
        
    }
    
    func testShouldReturnErrorOfCancelRequest() {
        DummyReachability.isConnected = true
        
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.MobileCatalogRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        sut.task = sut.getDataFromServer(url: request.mURL, withHeader: request.secretkey, withMethod: .GET) { (value, error) in
            
        }
        sut.cancelRequest()
        
        XCTAssertEqual((sut.task as! StubURLSessionDataTask).cancelWasCalled, true)
        
        
    }
    
   
    
    
}
