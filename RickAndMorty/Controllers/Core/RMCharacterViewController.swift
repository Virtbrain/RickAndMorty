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
