//
//  HomeView.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @State var navigateToDetail = false
    @State var isModal = false
    @State var notModal = false
    @State private var searchText = ""
    private let colors = Color.myColors()
    
    public init(viewModel: MainViewModel = MainViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
                    if viewModel.error != nil {
                        Button {
                            viewModel.getCharacters(isMoreLoading: false)
                        } label: {
                            Text("Try Again")
                                .padding(40)
                        }

                    } else {
                        if viewModel.isLoading == false {
                            VStack {
                                ForEach((viewModel.charactersList), id: \.self) { character in
                                    ShadowImageView(character: character)
                                    .contentShape(Rectangle()) // To avoid bug on tapGesture with image Clipped
                                    .onTapGesture {
                                        viewModel.currentCharacter = character
                                        self.navigateToDetail = true
                                    }
                                    
                                }
                                if viewModel.isMoreLoading {
                                    LoadingView()
                                        .padding()
                                } else {
                                    Button {
                                        viewModel.currentPage += 1
                                        viewModel.getCharacters(isMoreLoading: true)
                                    } label: {
                                        Label("Load more", systemImage: "arrow.counterclockwise")
                                            .padding(.top, Constants.leadingPaddingImage)
                                            .font(
                                                .title3
                                                .weight(.bold)
                                            )
                                    }
                                }
                            }
                            if !self.isModal {
                                NavigationLink("",
                                               destination: DetailCharacterView(character: viewModel.currentCharacter ?? ResultModel(),
                                                                                isSheet: false),
                                               isActive: $navigateToDetail)
                            }
                        } else {
                            LoadingView()
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationBarTitle("Rick and Morty", displayMode: .large)
            .toolbarBackground(.visible, for: .navigationBar)
            .searchable(text: $searchText)
            .refreshable(action: {
                viewModel.getCharacters(isMoreLoading: false)
            })
            .onChange(of: searchText) { searchText in
                if !searchText.isEmpty {
                    viewModel.charactersList = viewModel.charactersList.filter { $0.name.contains(searchText) }
                } else {
                    viewModel.reload(isMoreLoading: false)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {
                            self.isModal = false
                        }) {
                            HStack {
                                Text("Navigation")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                if !self.isModal {
                                    SwiftUI.Image(systemName: "checkmark.circle.fill")
                                }
                            }
                        }
                        Button(action: {
                            self.isModal = true
                        }) {
                            HStack {
                                Text("Sheet")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                if self.isModal {
                                    SwiftUI.Image(systemName: "checkmark.circle.fill")
                                }
                            }
                        }
                    }
                    label: {
                        Button {
                        } label: {
                            SwiftUI.Image(systemName: "rectangle.on.rectangle")
                        }
                    }
                }
            }
        }
        .accentColor(colors.RMCyanColor)
        .sheet(isPresented: (self.isModal) ? $navigateToDetail : $notModal, content: {
            DetailCharacterView(character: viewModel.currentCharacter ?? ResultModel(),
                                isSheet: true)
        })
        .onAppear {
            viewModel.getCharacters(isMoreLoading: false)
        }
    }
}

private enum Constants {
    static let imageWidth: CGFloat = 80
    static let imageHeight: CGFloat = 80
    static let leadingPaddingImage: CGFloat = 20
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MainViewModel())
    }
}
