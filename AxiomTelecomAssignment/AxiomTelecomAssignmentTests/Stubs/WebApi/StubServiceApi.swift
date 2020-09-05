//
//  StubWebApi.swift
//  AxiomTelecomAssignmentTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import AxiomTelecomAssignment


class DummyReachability: Reachability {
    static var isConnected = true
    override class func isConnectedToNetwork() -> Bool {
        return isConnected
        
    }
}

class StubServiceApi:ServiceApi  {

    private (set) var lastURL: String?
    var dummyData: Data?
    var dummyResponse:URLResponse?
    var dummyError:Error?
    
    override func getDataFromServer(url: String, withHeader header: [String : String]?, withMethod method: URLMethod?, completion: @escaping onCompletion) -> URLSessionTask?  {
        
        guard DummyReachability.isConnectedToNetwork() else {
            completion(nil, NetworkError.noNetwork)
            return nil
        }
        
        let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        
        
        if let urL = URL(string: urlString) {
            var request = URLRequest(url: urL)
            if let method = method {
                request.httpMethod = method.rawValue
            }
            
           
            task = session.dataTask(with: request) { (data, response, error) -> Void in
                ParserURLResponse.parseURLResponse(response: response, data: data, completion: completion,error: error)
            } as? StubURLSessionDataTask
            task?.resume()
            return task
        }
        return nil
    }
}
