//
//  CharactersModel.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

public struct CharactersModel: Decodable {
    public let info: InfoModel?
    public let results: [ResultModel]?
    
    public init(
        info: InfoModel?,
        results: [ResultModel]?
    ) {
        self.info = info
        self.results = results
    }
}
