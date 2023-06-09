//
//  InfoDto.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

public struct InfoDto: Decodable {
    public let count: Int?
    public let pages: Int?
    public let next: String?
    public let prev: Int?
    
    private enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        pages = try? values.decodeIfPresent(Int.self, forKey: .pages)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        prev = try? values.decodeIfPresent(Int.self, forKey: .prev)
    }
    
    public init(
        count: Int?,
        pages: Int?,
        next: String?,
        prev: Int?
    ) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
