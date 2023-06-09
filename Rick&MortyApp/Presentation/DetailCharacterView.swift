//
//  DetailCharacterView.swift
//  Rick&MortyApp
//
//  Created by Dani on 8/6/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailCharacterView: View {
    
    @ObservedObject var viewModel: DetailCharacterViewModel
    private var isSheet: Bool
    var character: ResultModel
    private let colors = Color.myColors()
    
    public init(viewModel: DetailCharacterViewModel = DetailCharacterViewModel(),
                character: ResultModel,
                isSheet: Bool) {
        self.character = character
        self.viewModel = DetailCharacterViewModel(character: self.character)
        self.isSheet = isSheet
    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                WebImage(url: URL(string: character.image))
                    .placeholder(Image("person"))
                    .resizable()
                    .frame(width: Constants.imageSize, height: Constants.imageSize)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.1),
                                                                   .black.opacity(0.5)]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                    )
                    .cornerRadius(Constants.imageSize / 2)
                    .padding(.top, (isSheet) ? Constants.topImagePadding : 0)
                HStack {
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(
                                .title
                                .weight(.bold)
                            )
                        Text(character.gender)
                            .padding(.bottom, Constants.paddingNameBottom)
                            .foregroundColor(colors.RMCyanColor)
                            .font(
                                .title2
                                .weight(.bold)
                            )
                        
                    }
                    Spacer()
                    
                }
                .padding(Constants.hsPadding)
                .frame(maxHeight: Constants.headerContainerSize)
                
                DetailListView(data: viewModel.dataList, listTitle: "Character information")
            }
        }
        .onAppear {
            viewModel.makeList()
        }
    }
    
    private enum Constants {
        static let headerContainerSize: CGFloat = 400.0
        static let hsPadding: CGFloat = 25.0
        static let topImagePadding: CGFloat = 40.0
        static let imageSize: CGFloat = 200.0
        static let paddingNameBottom: CGFloat = 16.0
    }
}
