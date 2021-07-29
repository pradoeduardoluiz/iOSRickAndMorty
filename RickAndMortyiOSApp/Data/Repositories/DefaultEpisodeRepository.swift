//
//  DefaultEpisodeRepository.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 29/07/21.
//

import Foundation

class DefaultEpisodeRepository: EpisodeRepository {
    
    private var service: RickAndMortyService
    
    func getEpisodesByIds(_ ids: [Int], completion: @escaping (Result<[Episode], Error>) -> Void) {
        service.getEpisodesByIds(ids) { response in
            switch response {
            case .success( let episodesDTO):
                let domain = episodesDTO.map{ $0.toDomain() }
                completion(.success(domain))
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
        
    init() {
        service = RickAndMortyService()
    }
    
}
