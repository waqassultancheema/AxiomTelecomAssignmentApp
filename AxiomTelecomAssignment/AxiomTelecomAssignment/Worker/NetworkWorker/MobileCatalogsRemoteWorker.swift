//
//  MobileCatalogsRemoteWorker.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//



import Foundation

protocol MobileCatalogsRemoteWorkerProtocal {
    func fetchMobileCatalogs(request:Request.Fetch.MobileCatalogRequest , complete :@escaping (MobileCatalogs?) -> Void, failure:@escaping (String?) -> Void)
}

class MobileCatalogsRemoteWorker: MobileCatalogsRemoteWorkerProtocal {
   
    
    var serviceApi:ServiceApi!
    func fetchMobileCatalogs(request:Request.Fetch.MobileCatalogRequest , complete :@escaping (MobileCatalogs?) -> Void, failure:@escaping (String?) -> Void) {
        
        if serviceApi == nil {
            serviceApi = ServiceApi()
        }
        serviceApi.getData(url: request.mURL,withHeader: request.secretkey, withMethod: .GET) {  (response, error) in
            guard error == nil else {
                failure(error?.localizedDescription)
                return
            }
            
            if let mData = response as? Data {
                do {
                    
                    let mobileCatalog = try? newJSONDecoder().decode(MobileCatalogs.self, from: mData)
                    complete(mobileCatalog)
                    
                } catch  {
                    failure(error.localizedDescription)
                }
            }
        }
    }
    
}

