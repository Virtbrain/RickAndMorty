//
//  RMCharacterPhotoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 08.09.2023.
//

import UIKit

final class RMCharacterPhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "RMCharacterPhotoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    public func configure(with viewModel: RMCharacterPhotoCollectionViewCellViewModel) {
        
    }
}
