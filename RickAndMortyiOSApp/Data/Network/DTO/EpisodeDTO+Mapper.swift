//
//  EpisodeDTO+Mapper.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 29/07/21.
//

import Foundation

struct EpisodeDTO: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

extension EpisodeDTO {
    func toDomain() -> Episode {
        Episode(
            id: id,
            name: name,
            airDate: airDate,
            episode: episode,
            characters: characters,
            url: url,
            created: created
        )
    }
}
