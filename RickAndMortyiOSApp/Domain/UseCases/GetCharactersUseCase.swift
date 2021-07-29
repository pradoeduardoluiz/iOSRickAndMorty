//
//  GetCharactersUseCase.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 22/07/21.
//

import Foundation

class GetCharactersUseCase: UseCase {
        
    private var repository: CharacterRepository
    
    func callAsFunction(params: Params, completion: @escaping (Result<Pagination<Character>, Error>) -> Void) {
        repository.getCharacters(params.currentPage) { result in
            switch result {
            case .success(let pagination):
                completion(.success(pagination))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    init() {
        repository = DefaultCharacterRepository()
    }
    
    struct Params {
        let currentPage: Int
    }
}

