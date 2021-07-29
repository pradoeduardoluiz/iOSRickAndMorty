//
//  PaginationModel.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 21/07/21.
//

import Foundation

struct Pagination<T> {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    let results: [T]
}
