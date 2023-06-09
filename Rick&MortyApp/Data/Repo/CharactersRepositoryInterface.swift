//
//  CharactersRepositoryInterface.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

import Foundation
import Combine
import Alamofire

public struct CharactersRepository {
    public var getCharacters: (String?) -> AnyPublisher<CharactersDto, AFError>
    
    public init(getCharacters: @escaping (String?) -> AnyPublisher<CharactersDto, AFError>) {
        self.getCharacters = getCharacters
    }
}
