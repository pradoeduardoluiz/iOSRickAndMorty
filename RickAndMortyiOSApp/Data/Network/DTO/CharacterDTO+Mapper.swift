//
//  CharacterDTO.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 22/07/21.
//

import Foundation

struct CharacterDTO: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: OriginDTO
    let image: String
    let created: String
    let location: LocationDTO
    let episode: [String]
    
    struct OriginDTO: Codable {
        let name: String
        let url: String
    }
    
    struct LocationDTO: Codable {
        let name: String
        let url: String
    }
    
} 

extension CharacterDTO {
    
    func toDomain() -> Character {
        return Character(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            origin: origin.toDomain(),
            image: image,
            created: created,
            location: location.toDomain(),
            episodeIds: episode.map { $0.components(separatedBy: "/").last ?? "0" }
        )
    }
    
}

extension CharacterDTO.LocationDTO {
    
    func toDomain() -> Character.Location {
        return Character.Location(
            name: name,
            url: url
        )
    }
    
}

extension CharacterDTO.OriginDTO {
    
    func toDomain() -> Character.Origin {
        return Character.Origin(
            name: name,
            url: url
        )
    }
    
}
