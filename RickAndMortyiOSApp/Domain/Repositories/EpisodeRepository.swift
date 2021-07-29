//
//  EpisodeRepository.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 29/07/21.
//

import Foundation

protocol EpisodeRepository {
    
    func getEpisodesByIds(_ ids: [Int], completion: @escaping (Result<[Episode], Error>) -> Void)
    
}
