//
//  UseCase.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 22/07/21.
//

import Foundation

public protocol UseCase {
    
    associatedtype P
    associatedtype R
    
    func callAsFunction(params: P, completion: @escaping (Result<R, Error>) -> Void)
}
