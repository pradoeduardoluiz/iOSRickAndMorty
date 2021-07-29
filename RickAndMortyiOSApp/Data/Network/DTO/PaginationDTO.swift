//
//  PaginationDTO.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 22/07/21.
//

import Foundation

struct PaginationDTO<T: Decodable>: Decodable {
    let info: PaginationInfoDTO
    let results: [T]
}
