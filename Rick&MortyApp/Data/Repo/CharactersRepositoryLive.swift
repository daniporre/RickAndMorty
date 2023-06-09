//
//  CharactersRepositoryLive.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

import Foundation
import Combine
import Alamofire

extension CharactersRepository {
    public static let live = Self(
        getCharacters: { idPage in
            
            return Network.shared.request(endPoint: Endpoint.requestCharacters(idPage: idPage ?? "1")
            )
            .validate()
            .publishDecodable(type: CharactersDto.self)
            .value()
        }
    )
}
