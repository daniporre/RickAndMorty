//
//  ResultObjectModel.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

public struct ResultObjectModel: Decodable, Hashable {
    public let name : String
    public let url: String
    
    public init() {
        self.name = ""
        self.url = ""
    }
    
    public init(
        name: String,
        url: String
    ) {
        self.name = name
        self.url = url
    }
}
