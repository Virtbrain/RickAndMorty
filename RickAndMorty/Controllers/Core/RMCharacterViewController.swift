//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 12.08.2023.
//

import UIKit

/// Controller to show and serach fo Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character, pathComponents: ["1"], queryParameters: [
        URLQueryItem(name: "name", value: "rick"),
        URLQueryItem(name: "status", value: "alive")])
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
            }
        }
    }

}
