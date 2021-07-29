//
//  CharacterRepository.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 22/07/21.
//

import Foundation

protocol CharacterRepository {
    
    func getCharacters(_ currentPage: Int, completion: @escaping (Result<Pagination<Character>, Error>) -> Void)
    
}
