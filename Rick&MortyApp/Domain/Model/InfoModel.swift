//
//  InfoModel.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

public struct InfoModel: Decodable {
    public let count: Int?
    public let pages: Int?
    public let next: String?
    public let prev: Int?
    
    public init() {
        self.count = 0
        self.pages = 0
        self.next = ""
        self.prev = 0
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

