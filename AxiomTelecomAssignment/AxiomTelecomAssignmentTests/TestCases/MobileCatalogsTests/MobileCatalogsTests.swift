//
//  MobileCatalogsTests.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import AxiomTelecomAssignment

class MobileCatalogsTests: XCTestCase {

    var jsonMobileCatalogssDictionaryStub : Array<Dictionary<String, AnyObject>>!

    override func setUp() {
        super.setUp()
        jsonMobileCatalogssDictionaryStub = loadJSONDictionaryFromBundle(withName: "MobileCatalog", extension: "json")
    }

//    override func tearDown() {
//
//    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonMobileCatalogssDictionaryStub)
    }
    
    
    
    func testShouldCreateMobileCatalogsFromDictionary()  {
        let firstMobileCatalogsJson = jsonMobileCatalogssDictionaryStub.first!
        do {
            let mobileCatalogs = try MobileCatalogElement(firstMobileCatalogsJson)
             XCTAssertNotNil(mobileCatalogs)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
       
        
    }
    
    
    func testShouldGetBrand() {
        let firstMobileCatalogsJson = jsonMobileCatalogssDictionaryStub.first!
        do {
            let mobileCatalogs = try MobileCatalogElement(firstMobileCatalogsJson)
            XCTAssertNotNil(mobileCatalogs.brand)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
        
    }
    
    func testShouldGetPrice() {
        let firstMobileCatalogsJson = jsonMobileCatalogssDictionaryStub.first!
        do {
            let mobileCatalogs = try MobileCatalogElement(firstMobileCatalogsJson)
            XCTAssertNotNil(mobileCatalogs.priceEur)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
        
    }
}
