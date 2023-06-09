//
//  ResultObjectDto.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

public struct ResultObjectDto: Decodable {
    public let name : String?
    public let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        url = try? values.decodeIfPresent(String.self, forKey: .url)
    }
    
    
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







