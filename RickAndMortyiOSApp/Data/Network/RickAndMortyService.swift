//
//  ApiService.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 21/07/21.
//

import Foundation
import Alamofire

class RickAndMortyService: NSObject {
    
    private let baseURL = "https://rickandmortyapi.com/api"
    
    func getCharacters(_ currentPage: Int, completion: @escaping ((Result<PaginationDTO<CharacterDTO>, Error>) -> ())) {
        let urlString = "\(baseURL)/character/?page=\(currentPage)"
        print(urlString)
        AF.request(urlString, method: .get).responseData { response in
            if let error = response.error {
                print(error)
                completion(.failure(error))
            }
            
            do {  
                let decoder = JSONDecoder()
                if let data = response.data {
                    let pagination = try decoder.decode(PaginationDTO<CharacterDTO>.self, from: data)
                    completion(.success(pagination))
                }
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        
    }
    
    func getEpisodesByIds(_ ids: [Int], completion: @escaping ((Result<[EpisodeDTO], Error>) -> ())) {
        let urlString = "\(baseURL)/episode/\(ids)".replacingOccurrences(of: ", ", with: ",")
        print(urlString)
        AF.request(urlString, method: .get).responseData { response in
            if let error = response.error {
                print(error)
                completion(.failure(error))
            }
            
            do {
                let decoder = JSONDecoder()
                if let data = response.data {
                    let response = try decoder.decode([EpisodeDTO].self, from: data)
                    completion(.success(response))
                }
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        
    }
}
