//
//  StubMobileCatalogsInteractor.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import AxiomTelecomAssignment


class StubMobileCatalogsInteractor: MobileCatalogsInteractor {
    
    

    
    override func fetchMobileCatalogs(searchString: String, selectedCategory: String) {
        self.filterdMobileCatalogs = [StubMobileCatalogElement.dummyMobileCatalogElement()]
        self.output.passedToPresenterFetchedMobileCatalogs(mobileCatalogs: self.filterdMobileCatalogs, categories: self.filterdMobileCatalogs.map{($0.brand ?? "")})
    }

}
