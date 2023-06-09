//
//  DetailCharacterViewModel.swift
//  Rick&MortyApp
//
//  Created by Dani on 9/6/23.
//

import Foundation

public class DetailCharacterViewModel: ObservableObject {
    
    private var character: ResultModel
    @Published var dataList: [ListModel] = []
    
    public init() {
        self.character = ResultModel()
    }
    
    public init(character: ResultModel) {
        self.character = character
    }
    
    public func makeList() {
        self.dataList = [
            ListModel(key: "Status", value: character.status),
            ListModel(key: "Specie", value: character.species),
            ListModel(key: "Origin", value: character.origin.name),
            ListModel(key: "Location", value: character.location.name),
            ListModel(key: "Appears", value: "\(character.episode.count)")
        ]
    }
    
    
}














