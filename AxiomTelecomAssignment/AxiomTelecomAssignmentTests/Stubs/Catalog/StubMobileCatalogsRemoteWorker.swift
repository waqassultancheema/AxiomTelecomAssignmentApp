//
//  StubMobileCatalogsRemoteWorker.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

@testable import AxiomTelecomAssignment

class StubMobileCatalogsRemoteWorker: MobileCatalogsRemoteWorker {

    var shouldFailOnFetch:Bool = false
    var dataToReturnOnSuccess:MobileCatalogs?
    

    override func fetchMobileCatalogs(request: Request.Fetch.MobileCatalogRequest, complete: @escaping (MobileCatalogs?) -> Void, failure: @escaping (String?) -> Void) {
        
        if shouldFailOnFetch {
            failure(NetworkError.other("Test failing").localizedDescription)
        } else {
            if let data = dataToReturnOnSuccess {
                complete(data)
            }
        }
    }
    
    
}
