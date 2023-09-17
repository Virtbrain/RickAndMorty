//
//  RMSearchResultsViewModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 16.09.2023.
//

import Foundation

//protocol RMSearchResultRepresentable {
//    associatedtype ResultsType
//
//    var results: [ResultsType] {get}
//}
//
//struct RMSearchResultViewModel<T: Codable>: RMSearchResultRepresentable {
//    typealias ResultsType = T
//    var results: [ResultsType]
//
//}

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case location([RMLocationTableViewCellViewModel])
}
