//
//  NetworkError.swift
//  AxiomTelecomAssignment
//
//  Created by Waqas Sultan on 04/09/2020.
//  Copyright © 2020 Waqas Sultan. All rights reserved.
//

import Foundation


enum NetworkError: Error {
    case noNetwork
    case parsingError(String)
    case unknown(String)
    case other(String)
}

extension NetworkError: LocalizedError {
    
    var localizedDescription : String {
        
        switch self {
        case .noNetwork:
            return "Please check your internet connection."
        case .parsingError(let error):
            return error
        case .unknown(let error):
            return error
        case .other(let error):
            return error
        }
    }
}
