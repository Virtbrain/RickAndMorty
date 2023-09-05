//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 06.09.2023.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject {
    func fetchCharacters() {
        RMService.shared.execute(.listCharacters, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.count))
                print("Page result count: " + String(model.info.pages))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath) as? RMCharacterCollectionViewCell
        else {
            fatalError("Unsupported cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Alex",
                                                               characterStatus: .alive,
                                                               characterImageUrl: nil)
        cell.configure(with: viewModel)
        return cell
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
}
