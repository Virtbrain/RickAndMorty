//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 08.09.2023.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel{
    private let imageUrl: URL?
    
    init(imageUrl: URL?){
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(compition: @escaping (Result<Data, Error>) -> Void) {
        guard let imageUrl = imageUrl else {
            compition(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageUrl, completion: compition)
    }
}
