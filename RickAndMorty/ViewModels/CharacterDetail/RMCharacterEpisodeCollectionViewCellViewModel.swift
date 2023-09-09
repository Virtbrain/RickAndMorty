//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 08.09.2023.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    let episodeDataURL: URL?
    
    init(episodeDataURL: URL?){
        self.episodeDataURL = episodeDataURL
    }
}
