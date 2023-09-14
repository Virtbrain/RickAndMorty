//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 14.09.2023.
//

import Foundation

//Responsibilities
// - show search results
// - sow no results view
// - kick off API request

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
}
