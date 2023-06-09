//
//  Endpoint.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

import Alamofire
import SwiftUI

enum Endpoint {
    case requestCharacters(idPage: String)
}

extension Endpoint: EndPointProtocol {
    var headers: [String : String] {
        return [:]
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    private var baseURL: String {
        return "https://rickandmortyapi.com/"
    }
    
    private var apiVersion: String {
        return "api"
    }
    
    private var relativeURL: String {
        switch self {
        case let .requestCharacters(idPage):
            if idPage != "1" {
                return "character?page=\(idPage)"
            } else {
                return "character"
            }
        }
    }
    
    var method: String {
        return URLRequestMethod.get.rawValue
    }

    private var url: URL? {
        return URL(string: urlString)
    }
    
    var urlString: String {
        return "\(self.baseURL)/\(apiVersion)/\(relativeURL)"
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case URLRequestMethod.get.rawValue:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}



