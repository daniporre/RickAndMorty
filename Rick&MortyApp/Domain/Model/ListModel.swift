//
//  ListModel.swift
//  Rick&MortyApp
//
//  Created by Dani on 9/6/23.
//

import Foundation

public struct ListModel: Hashable {
    
    public let key: String
    public let value: String
    
    public init(key: String,
                value: String
    ) {
        self.key = key
        self.value = value
    }
}
