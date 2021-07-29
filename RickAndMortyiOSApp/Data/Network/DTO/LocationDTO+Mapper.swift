//
//  LocationDTO+Mapper.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 29/07/21.
//

import Foundation

struct LocationDTO: Codable {
    let id: Int?
    let name: String
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String
    let created: String?
}
