//
//  MobileCatalogsInteractor.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import UIKit

protocol MobileCatalogsDataSource {
    var filterdMobileCatalogs:MobileCatalogs! { get}
}
protocol MobileCatalogsInteractorInput {

    func fetchMobileCatalogs(searchString:String)
}

protocol MobileCatalogsInteractorOutput {
    func passedToPresenterFetchedMobileCatalogs(mobileCatalogs:MobileCatalogs)
    func errorWhileFetchMobileCatalogs(error:String)
}
class MobileCatalogsInteractor:MobileCatalogsInteractorInput,MobileCatalogsDataSource {
   
    var filterdMobileCatalogs: MobileCatalogs!
    var output: MobileCatalogsInteractorOutput!
    var worker: MobileCatalogsRemoteWorkerProtocal!
    private var mobileCatalogs:MobileCatalogs!
    
    func fetchMobileCatalogs(searchString:String) {
        if worker == nil {
            worker = MobileCatalogsRemoteWorker()
        }
            if let mobileCatalogs = mobileCatalogs {
                filterMobileCatalogs(mobileCatalogs: mobileCatalogs, searchString: searchString)
            } else {
                fetchArticleFromWorker( searchString: searchString)
            }

        
    
       }
    
    func fetchArticleFromWorker(searchString:String) {
        
        worker.fetchMobileCatalogs( request: Request.Fetch.MobileCatalogRequest(), complete: { [unowned self] (mobileCatalogs) in
            self.mobileCatalogs = mobileCatalogs
            self.filterMobileCatalogs(mobileCatalogs: mobileCatalogs ?? [],searchString: searchString)
        }) { (error) in
            self.output.errorWhileFetchMobileCatalogs(error: error ?? "Error Occured While Fetching")

        }
    }
    
    internal func filterMobileCatalogs(mobileCatalogs:MobileCatalogs ,searchString:String) {
        if searchString.count == 0 {
            filterdMobileCatalogs = mobileCatalogs

        } else {
            let results = mobileCatalogs.filter({ (catelog) -> Bool in
                if catelog.brand?.contains(searchString) ?? false {
                   return true
              }
               return false
          })
           filterdMobileCatalogs = results
        }
        
        self.output.passedToPresenterFetchedMobileCatalogs(mobileCatalogs: filterdMobileCatalogs)

    }
    
    

}
