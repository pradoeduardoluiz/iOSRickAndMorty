//
//  DefaultCharacterRepository.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 22/07/21.
//

import Foundation

class DefaultCharacterRepository: CharacterRepository {
    
    private var service: RickAndMortyService
    
    func getCharacters(_ currentPage: Int, completion: @escaping (Result<Pagination<Character>, Error>) -> Void) {
        service.getCharacters(currentPage) { response in
            switch response {
            case .success( let paginationDTO):
                let paginationDomain = Pagination(
                    count: paginationDTO.info.count,
                    pages: paginationDTO.info.pages,
                    next: paginationDTO.info.next,
                    prev: paginationDTO.info.prev,
                    results: paginationDTO.results.map({ characterDTO in
                        characterDTO.toDomain()
                    }))
                completion(.success(paginationDomain))
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
