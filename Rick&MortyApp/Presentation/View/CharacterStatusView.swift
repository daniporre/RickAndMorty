//
//  CharacterStatusView.swift
//  Rick&MortyApp
//
//  Created by Dani on 12/6/23.
//

import Foundation
import SwiftUI

public struct CharacterStatusView: View {
    
    var characterStatus: String
    private let colors = Color.myColors()
    
    public var body: some View {
        Circle()
            .frame(width: 10, height: 10)
            .foregroundColor((characterStatus == "Alive") ? Color.green :
                            (characterStatus == "Dead") ? Color.red : Color.blue)
    }
}
