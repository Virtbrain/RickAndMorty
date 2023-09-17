//
//  RMSearchResultsViewModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 16.09.2023.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case location([RMLocationTableViewCellViewModel])
}
