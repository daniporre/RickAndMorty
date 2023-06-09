//
//  MainViewModel.swift
//  Rick&MortyApp
//
//  Created by Dani on 7/6/23.
//

import Foundation
import Combine

public class MainViewModel: ObservableObject {
    
    private var getCharactersUseCase: GetCharactersUseCase = .live
    private var task: Cancellable?
    @Published var characters: CharactersModel?
    @Published var charactersList: [ResultModel] = []
    @Published var dataList: [ListModel] = []
    @Published var error: Error?
    @Published var isLoading: Bool = true
    @Published var isMoreLoading: Bool = true
    @Published var currentCharacter: ResultModel?
    @Published var currentPage: Int = 1
    
    public func getCharacters(isMoreLoading: Bool) {
        error = nil
        if !isMoreLoading {
            isLoading = true
        } else {
            self.isMoreLoading = true
        }
        
        task = getCharactersUseCase.getCharacters(self.currentPage.description).sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                    self.isLoading = false
                    self.isMoreLoading = false
                    print("Error: \(error.localizedDescription)")
                }
            },
            receiveValue: { [weak self] response in
                ///This delay is to see a custom loading view
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.characters = response
                    self?.charactersList.append(contentsOf: response.results ?? [])
                    self?.isLoading = false
                    self?.isMoreLoading = false
                }
            }
        )
    }
    
    public func reload(isMoreLoading: Bool) {
        self.currentPage = 1
        self.charactersList = []
        self.getCharacters(isMoreLoading: isMoreLoading)
    }
    
    public func search(searchText: String) {
        
    }
}
