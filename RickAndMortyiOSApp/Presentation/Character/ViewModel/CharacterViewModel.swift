//
//  CharacterViewModel.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 21/07/21.
//

import Foundation

protocol CharacterViewModelInput {
    func getCharacters()
}

protocol CharacterViewModelOutput {
    var characters: Observable<[Character]> { get }
    var error: Observable<String> { get }
    var isLoading: Observable<Bool> { get }
}

class CharacterViewModel: CharacterViewModelInput, CharacterViewModelOutput {
    
    private var getCharactersUseCase: GetCharactersUseCase
    private var pagingHandler: DefaultPagingHandler<Character>
    
    var characters: Observable<[Character]> = Observable([])
    var error: Observable<String> = Observable("")
    var isLoading: Observable<Bool> = Observable(false)
    
    private var items: [Character] = []
    
    func getCharacters() {
        if pagingHandler.shouldRequestNewPage(reset: pagingHandler.isFirstPage()) {
            print("Current Page: \(self.pagingHandler.getCurrentPage())")
            isLoading.value = true
            getCharactersUseCase(params: .init(currentPage: self.pagingHandler.getCurrentPage())) { result in
                switch result {
                case .success(let pagination):
                    self.pagingHandler.appendPage(page: pagination)
                    self.characters.value = self.pagingHandler.getAllItems()
                    self.isLoading.value = false
                case .failure(let error):
                    print(error)
                    self.error.value = error.localizedDescription
                    self.isLoading.value = false
                }
            }
        }
    }
    
    init() {
        getCharactersUseCase = GetCharactersUseCase()
        pagingHandler = DefaultPagingHandler<Character>()
    }
    
}
