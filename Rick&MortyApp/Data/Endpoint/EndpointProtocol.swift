//
//  EndpointProtocol.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

import Foundation
import Alamofire

public protocol EndPointProtocol {
    var headers: [String: String] { get }
    var method: String { get }
    var urlString: String { get }
    var parameters: [String: Any] { get }
    var encoding: ParameterEncoding { get }
}

public enum URLRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
