//
//  Network.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

import Foundation
import Alamofire
import Combine

public class Network {
    public static let shared = Network()
    
    var session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 15
        return Session.init(configuration: configuration,
                            interceptor: nil)
    }()
    
    public func request(endPoint: EndPointProtocol) -> DataRequest {
        let headers = HTTPHeaders(endPoint.headers)
        let method = HTTPMethod(rawValue: endPoint.method)
        return session.request(endPoint.urlString,
                               method: method,
                               parameters: endPoint.parameters,
                               encoding: endPoint.encoding,
                               headers: headers)
    }
}
