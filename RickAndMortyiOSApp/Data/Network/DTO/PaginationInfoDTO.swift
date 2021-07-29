//
//  PaginationInfoDTO.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 22/07/21.
//

import Foundation

struct PaginationInfoDTO: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
