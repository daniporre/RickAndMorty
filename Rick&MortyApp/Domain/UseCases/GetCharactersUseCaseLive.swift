//
//  GetCharactersUseCase.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

import Foundation
import Combine
import Alamofire

extension GetCharactersUseCase {
    public static let live = Self(
        getCharacters: { idPage in
            let repository: CharactersRepository = .live
            return repository.getCharacters(idPage)
                .mapError { error in
                    return error
                }
                .map { charactersDto in
                    // Call mapper
                    let mapper = CharactersMapper()
                    return mapper.mapValue(response: charactersDto)
                }
                .eraseToAnyPublisher()
        }
    )
}
