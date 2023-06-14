//
//  CharacterMiniInfoView.swift
//  Rick&MortyApp
//
//  Created by Dani on 12/6/23.
//
import Foundation
import SwiftUI

public struct CharacterMiniInfoView: View {

    var character: ResultModel
    private let colors = Color.myColors()
    
    public var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(
                        .largeTitle
                        .weight(.bold)
                    )
                HStack (alignment: .center) {
                    CharacterStatusView(characterStatus: character.status)
                    Text("\(character.status) - \(character.gender)")
                        .foregroundColor(colors.RMCyanColor)
                        .font(
                            .title2
                            .weight(.bold)
                        )
                }
                .padding(.bottom, Constants.paddingNameBottom)
                
            }
            Spacer()
        }
    }
    
    private enum Constants {
        static let paddingNameBottom: CGFloat = 16.0
    }
}


