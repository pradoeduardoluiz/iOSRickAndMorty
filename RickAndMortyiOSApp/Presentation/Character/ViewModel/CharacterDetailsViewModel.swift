//
//  CharacterDetailsViewModel.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 29/07/21.
//

import Foundation

protocol CharacterDetailsViewModelInput {
    func getEpisodes(character: Character)
}

protocol CharacterDetailsViewModelOutput {
    var episodes: Observable<[Episode]> { get }
    var error: Observable<String> { get }
    var isLoading: Observable<Bool> { get }
}

class CharacterDetailsViewModel: CharacterDetailsViewModelInput, CharacterDetailsViewModelOutput {
    
    private var getEpisodesByIdsUseCase: GetEpisodesByIdsUseCase
    
    var episodes: Observable<[Episode]> = Observable([])
    var error: Observable<String> = Observable("")
    var isLoading: Observable<Bool> = Observable(false)
    
    private var items: [Episode] = []
    
    func getEpisodes(character: Character) {
        let ids:[Int] = character.episodeIds.map({ id in
            Int(id)!
        })
        
        getEpisodesByIdsUseCase(params: .init(ids: ids)) { result in
            switch result {
            case .success(let episodes):
                self.episodes.value = episodes
                self.isLoading.value = false
            case .failure(let error):
                print(error)
                self.error.value = error.localizedDescription
                self.isLoading.value = false
            }
        }
    }
    
    init() {
        getEpisodesByIdsUseCase = GetEpisodesByIdsUseCase()
    }
    
}
