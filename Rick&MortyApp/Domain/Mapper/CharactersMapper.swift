//
//  CharactersMapper.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

import Foundation

public class CharactersMapper: Mapper<CharactersDto, CharactersModel> {
    public override func mapValue(response: CharactersDto) -> CharactersModel {
        
        return CharactersModel(info: InfoModel(count: response.info?.count,
                                               pages: response.info?.pages,
                                               next: response.info?.next,
                                               prev: response.info?.prev),
                               results: ResultMapper().mapList(response: response.results ?? []))
    }
}
