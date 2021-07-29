//
//  GetEpisodesByIds.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 29/07/21.
//

import Foundation

class GetEpisodesByIdsUseCase: UseCase {
    
    private var repository: EpisodeRepository
    
    func callAsFunction(params: Params, completion: @escaping (Result<[Episode], Error>) -> Void) {
        repository.getEpisodesByIds(params.ids) { result in
            switch result {
            case .success(let episodes):
                completion(.success(episodes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    init() {
        repository = DefaultEpisodeRepository()
    }
 
    struct Params {
        let ids: [Int]
    }
    
}
