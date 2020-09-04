//
//  RequestModel.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import Foundation



enum Request {
    enum Fetch
    {
        struct MobileCatalogRequest
        {

            var secretkey:[String : String] {
                return ["secret-key" : "$2b$10$ldwbG.B/2hNRvS2dzXDxoO5P87sYGwoE02SliZIh.8vlvsSctGqF2"]
            }
            var mURL: String {
                let url = String(format: APIURLPrefix + "b/5f3a3fcf4d939910361666fe/latest")
                return url
            }
        }
    }
}
