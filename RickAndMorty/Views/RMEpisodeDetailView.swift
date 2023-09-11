//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 10.09.2023.
//

import UIKit

final class RMEpisodeDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
