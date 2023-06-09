//
//  ResultDto.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

public struct ResultDto: Decodable {
    public let id : Int?
    public let name: String?
    public let status: String?
    public let species: String?
    public let type : String?
    public let gender: String?
    public let origin: ResultObjectDto?
    public let location: ResultObjectDto?
    public let image : String?
    public let episode: [String]?
    public let url: String?
    public let created: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        species = try? values.decodeIfPresent(String.self, forKey: .species)
        type = try? values.decodeIfPresent(String.self, forKey: .type)
        gender = try? values.decodeIfPresent(String.self, forKey: .gender)
        origin = try? values.decodeIfPresent(ResultObjectDto.self, forKey: .origin)
        location = try? values.decodeIfPresent(ResultObjectDto.self, forKey: .location)
        image = try? values.decodeIfPresent(String.self, forKey: .image)
        episode = try? values.decodeIfPresent([String].self, forKey: .episode)
        url = try? values.decodeIfPresent(String.self, forKey: .url)
        created = try? values.decodeIfPresent(String.self, forKey: .created)
    }
    
    public init(
        id: Int?,
        name: String?,
        status: String?,
        species: String?,
        type: String?,
        gender: String?,
        origin: ResultObjectDto?,
        location: ResultObjectDto?,
        image: String?,
        episode: [String]?,
        url: String?,
        created: String?
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






