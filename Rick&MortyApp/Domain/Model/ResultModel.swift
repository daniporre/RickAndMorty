//
//  ResultModel.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

import Foundation

public struct ResultModel: Decodable, Hashable {
    
    public let id : Int
    public let name: String
    public let status: String
    public let species: String
    public let type : String
    public let gender: String
    public let origin: ResultObjectModel
    public let location: ResultObjectModel
    public let image : String
    public let episode: [String]
    public let url: String
    public let created: String
    
    public init() {
        self.id = 0
        self.name = ""
        self.status = ""
        self.species = ""
        self.type = ""
        self.gender = ""
        self.origin = ResultObjectModel()
        self.location = ResultObjectModel()
        self.image = ""
        self.episode = []
        self.url = ""
        self.created = ""
    }
        
    public init(
        id: Int,
        name: String,
        status: String,
        species: String,
        type: String,
        gender: String,
        origin: ResultObjectModel,
        location: ResultObjectModel,
        image: String,
        episode: [String],
        url: String,
        created: String
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
