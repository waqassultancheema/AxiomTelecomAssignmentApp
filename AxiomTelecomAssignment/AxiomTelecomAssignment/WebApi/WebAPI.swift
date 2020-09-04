//
//  WebAPI.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import Foundation

typealias onCompletion = (Any?, NetworkError?)->()

public enum URLMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
    case PATCH
}


protocol WebAPIHandler {
    func getDataFromServer( url: String, withHeader header: [String : String]?, withMethod method: URLMethod?,completion: @escaping onCompletion) -> URLSessionTask?
}
