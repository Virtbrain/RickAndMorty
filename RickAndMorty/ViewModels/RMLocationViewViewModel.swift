//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 13.09.2023.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    //Location response info
    //Will contain next url, if present
    
    private var cellViewModels: [String] = []
    
    init() {
        
    }
    
    public func fetchLOcations() {
        RMService.shared.execute(.listLocationsRequests, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
    
}
