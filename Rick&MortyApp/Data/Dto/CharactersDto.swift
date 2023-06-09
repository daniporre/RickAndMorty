//
//  CharactersDto.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//


public struct CharactersDto: Decodable {
    public let info: InfoDto?
    public let results: [ResultDto]?
    
    private enum CodingKeys: String, CodingKey {
        case info
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        info = try? values.decodeIfPresent(InfoDto.self, forKey: .info)
        results = try? values.decodeIfPresent([ResultDto].self, forKey: .results)
        
    }
    
    public init(
        info: InfoDto?,
        results: [ResultDto]?
    ) {
        self.info = info
        self.results = results
    }
}

