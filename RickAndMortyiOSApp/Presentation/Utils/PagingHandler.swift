//
//  PageHandler.swift
//  RickAndMortyiOSApp
//
//  Created by Luiz Eduardo do Prado on 22/07/21.
//

import Foundation

protocol PagingHandler {
    associatedtype ResultType
    
    func getCurrentPage() -> Int
    func isFirstPage() -> Bool
    func isLastPage() -> Bool
    func getAllItems() -> [ResultType]
    func shouldRequestNewPage(reset: Bool) -> Bool
    func appendPage(page: Pagination<ResultType>)
    
}

class DefaultPagingHandler<T>: PagingHandler {
    
    typealias ResultType = T
    
    private var currentPage: Int = 1
    private var lastPage: Int = Int.max
    
    private var allItems: [T] = []
    
    func getCurrentPage() -> Int {
        return currentPage
    }
    
    func isFirstPage() -> Bool {
        return currentPage == 1
    }
    
    func isLastPage() -> Bool {
        return currentPage == lastPage
    }
    
    func getAllItems() -> [T] {
        return allItems
    }
        
    func shouldRequestNewPage(reset: Bool) -> Bool {
        if reset { resetPage() }
        if currentPage > lastPage {
            return false
        } else {
            return true
        }
    }
    
    func appendPage(page: Pagination<T>) {
        page.results.forEach { item in
            allItems.append(item)
        }
        
        lastPage = page.pages
        currentPage += 1
    }
    
    private func resetPage() {
        currentPage = 1
        lastPage = Int.max
        allItems = []
    }
}
