//
//  CharacterModel.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 21/07/21.
//

import Foundation

struct Character {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Character.Origin
    let image: String
    let created: String
    let location: Character.Location
    let episodeIds: [String]
    
    struct Origin {
        let name: String
        let url: String
    }
    
    struct Location {
        let name: String
        let url: String
    }
}
