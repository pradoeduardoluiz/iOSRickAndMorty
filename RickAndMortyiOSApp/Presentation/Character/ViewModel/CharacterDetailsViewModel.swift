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
    var error: Observable<String> { get }
    var isLoading: Observable<Bool> { get }
    var sections: Observable<[CharacterDetailSection]> { get }
}

class CharacterDetailsViewModel: CharacterDetailsViewModelInput, CharacterDetailsViewModelOutput {
    
    private var getEpisodesByIdsUseCase: GetEpisodesByIdsUseCase
    
    var episodes: Observable<[Episode]> = Observable([])
    var error: Observable<String> = Observable("")
    var isLoading: Observable<Bool> = Observable(false)
    var sections: Observable<[CharacterDetailSection]> = Observable([])
    
    private var items: [Episode] = []
    
    func getEpisodes(character: Character) {
        
        var sections: [CharacterDetailSection] = []
        
        sections.append(
            CharacterDetailSection(
                sectionName: "",
                items: []
            )
        )
        
        sections.append(
            CharacterDetailSection(
                sectionName: "Informations",
                items: [
                    CharacterDetailItem(title: "Gender", subTitle: character.gender, detail: nil, accessoryType: .none),
                    CharacterDetailItem(title: "Origin", subTitle: character.origin.name, detail: nil, accessoryType: .none),
                    CharacterDetailItem(title: "Type", subTitle: character.type, detail: nil, accessoryType: .none),
                    CharacterDetailItem(title: "Location", subTitle: character.location.name, detail: nil, accessoryType: .disclosureIndicator)
                ]
            )
        )
    
        let ids:[Int] = character.episodeIds.map({ id in
            Int(id)!
        })
        
        getEpisodesByIdsUseCase(params: .init(ids: ids)) { result in
            switch result {
            case .success(let episodes):
                sections.append(
                    CharacterDetailSection(
                        sectionName: "Epidodes",
                        items: episodes.map({ episode in
                            CharacterDetailItem(
                                title: episode.episode,
                                subTitle: episode.name,
                                detail: episode.airDate,
                                accessoryType: .disclosureIndicator
                            )
                        })
                    )
                )
                self.sections.value = sections
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
