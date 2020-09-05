//
//  LRUCacheTests.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import AxiomTelecomAssignment

class LRUCacheTests: XCTestCase {

    
    let cache = LRUCache<String,Int>(capacity: 2)

    override func setUp() {
        super.setUp()
    }
    
    func testSetValue() {
        cache.setValue(1, for: "a")
        XCTAssertEqual(cache.getValue(for: "a"), 1)
    }



}
