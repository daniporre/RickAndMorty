//
//  GetCharactersUseCaseInterface.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

import Foundation
import Combine
import Alamofire

public struct GetCharactersUseCase {
    public var getCharacters: (String) -> AnyPublisher<CharactersModel, Error>
    
    public init(getCharacters: @escaping (String) -> AnyPublisher<CharactersModel, Error>) {
        self.getCharacters = getCharacters
    }
}
