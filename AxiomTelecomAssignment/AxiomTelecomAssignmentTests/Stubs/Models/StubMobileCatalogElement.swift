//
//  StubMobileCatalogElement.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/9/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

@testable import AxiomTelecomAssignment
class StubMobileCatalogElement: MobileCatalogElement {

    static func dummyMobileCatalogElement() -> StubMobileCatalogElement  {
        return StubMobileCatalogElement(id: 12, brand: "Apple", phone: "123", picture: "", announceDate: nil, sim: "", resolution: "", audioJack: "", gps: "", battery: "", priceEur: 100)
    }
}
