//
//  ShadowImageView.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShadowImageView: View {
    
    var character: ResultModel
    private let colors = Color.myColors()
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: character.image))
                .resizable()
                .placeholder(Image("person"))
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.1),
                                                       .black.opacity(0.5),
                                                       .black]),
                           startPoint: .top,
                           endPoint: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: 350, alignment: .top)
        .cornerRadius(Constants.cornerRadiusImage)
        .padding(Constants.imagePadding)
        .shadow(color: Color.myColors().RMPinkColor.opacity(0.5),
                radius: 15,
                x: 0,
                y: 15)
        .overlay{
            VStack{
                Spacer()
                VStack (alignment: .leading) {
                    Text(character.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(
                            .largeTitle
                            .weight(.bold)
                        )
                    HStack (alignment: .bottom) {
                        Group {
                            CharacterStatusView(characterStatus: character.status)
                                .padding(.bottom, Constants.statusPadding)
                            Text(character.species)
                                .font(.title)
                            Text("-")
                                .font(
                                    .title2
                                    .weight(.light)
                                )
                            Text(character.gender)
                                .padding(.bottom, 1)
                                .font(
                                    .title2
                                    .weight(.light)
                                )
                        }
                        .foregroundColor(colors.RMCyanColor)
                        .frame(alignment: .leading)
                    }
                }
                .padding([.leading, .bottom], Constants.cardPadding)
            }
        }
    }
    
    private enum Constants {
        static let cornerRadiusImage: CGFloat = 16
        static let cardPadding: CGFloat = 42
        static let statusPadding: CGFloat = 12
        static let imagePadding: CGFloat = 20
    }
}


