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

    func fetchMobileCatalogs(searchString:String, selectedCategory: String)
}

protocol MobileCatalogsInteractorOutput {
    func passedToPresenterFetchedMobileCatalogs(mobileCatalogs:MobileCatalogs, categories: [String])
    func errorWhileFetchMobileCatalogs(error:String)
}
class MobileCatalogsInteractor:MobileCatalogsInteractorInput,MobileCatalogsDataSource {
   
    var filterdMobileCatalogs: MobileCatalogs!
    var output: MobileCatalogsInteractorOutput!
    var worker: MobileCatalogsRemoteWorkerProtocal!
    private var mobileCatalogs:MobileCatalogs!
    
    func fetchMobileCatalogs(searchString:String, selectedCategory: String) {
        if worker == nil {
            worker = MobileCatalogsRemoteWorker()
        }
            if let mobileCatalogs = mobileCatalogs {
                filterMobileCatalogs(mobileCatalogs: mobileCatalogs, searchString: searchString,selectedCategory: selectedCategory)
            } else {
                fetchMobileCatalogsFromWorker( searchString: searchString)
            }

        
    
       }
    
    func fetchMobileCatalogsFromWorker(searchString:String) {
        
        worker.fetchMobileCatalogs( request: Request.Fetch.MobileCatalogRequest(), complete: { [unowned self] (mobileCatalogs) in
            self.mobileCatalogs = mobileCatalogs
            let categories = self.mobileCatalogs.map {($0.brand ?? "")}
            self.filterMobileCatalogs(mobileCatalogs: mobileCatalogs ?? [],searchString: searchString, selectedCategory: categories.first ?? "")
        }) { (error) in
            self.output.errorWhileFetchMobileCatalogs(error: error ?? "Error Occured While Fetching")
        }
    }
    
    internal func filterMobileCatalogs(mobileCatalogs:MobileCatalogs ,searchString:String, selectedCategory: String) {
        if searchString.count == 0 {
            let results = mobileCatalogs.filter({ (catelog) -> Bool in
                if (catelog.brand ?? "").lowercased() == selectedCategory.lowercased() {
                     return true
                }
                 return false
            })
             filterdMobileCatalogs = results

        } else {
            let results = mobileCatalogs.filter({ (catelog) -> Bool in
                if ((catelog.brand?.lowercased().contains(searchString.lowercased()) ?? true) || ("\(catelog.priceEur ?? 0)".lowercased().contains(searchString.lowercased())) || (catelog.phone?.lowercased().contains(searchString.lowercased()) ?? true)  || (catelog.sim?.lowercased().contains(searchString.lowercased()) ?? true)  || (catelog.gps?.contains(searchString.lowercased()) ?? true)  || (catelog.audioJack?.lowercased().contains(searchString.lowercased()) ?? true)) &&  (catelog.brand ?? "").lowercased() == selectedCategory.lowercased() {
                   return true
              }
               return false
          })
           filterdMobileCatalogs = results
        }
        
        self.output.passedToPresenterFetchedMobileCatalogs(mobileCatalogs: filterdMobileCatalogs, categories: mobileCatalogs.map {($0.brand ?? "")})

    }
    
    

}
