//
//  DetailListView.swift
//  Rick&MortyApp
//
//  Created by Dani on 9/6/23.
//

import SwiftUI

public struct DetailListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let data: [ListModel]
    var listTitle: String?
    private let colors = Color.myColors()
    
    public var body: some View {
        VStack {
            if let title = listTitle {
                Group {
                    HStack {
                        Text(title)
                            .font(
                                .title2
                                .weight(.bold)
                            )
                        Spacer()
                    }
                    Rectangle()
                        .foregroundColor(colors.RMCyanColor)
                        .frame(maxWidth: .infinity, maxHeight: Constants.dividerHeight)
                }
                .padding(.horizontal, 20)
            }
            ForEach(data, id: \.self) { item in
                VStack {
                    HStack {
                        Text(item.key)
                            .foregroundColor(Color.gray)
                            .font(
                                .title2
                            )
                        Spacer()
                        Text(item.value)
                            .foregroundColor(colors.RMPinkColor)
                            .font(
                                .title3
                                .bold()
                            )
                    }
                }
                .padding(.top, Constants.basicPadding)
                .padding(.horizontal, Constants.rowPadding)
            }
        }
        .padding(.bottom, Constants.basicPadding)
        .accentColor(.black)
    }
    
    // MARK: - Constants
    private enum Constants {
        static let basicPadding: CGFloat = 12.0
        static let rowPadding: CGFloat = 24.0
        static let textItemSize: CGFloat = 14.0
        static let separatorHeight: CGFloat = 0.5
        static let dividerHeight: CGFloat = 1
        static let navigationButtonSize: CGFloat = 20
        static let navigationButtonsGap: CGFloat = 32.5
    }
}
