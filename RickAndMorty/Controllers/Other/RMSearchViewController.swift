//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 11.09.2023.
//

import UIKit

//Dynamic search oprion view
//Render results
//Render no results zero state
//Searching /API Call


/// Configurable controller to search
final class RMSearchViewController: UIViewController {
    /// Configuration for search session
    struct Config {
        enum `Type` {
            case character// allow name | status | gender
            case episode //allow names
            case location //allow name | type
            
            var title: String {
                switch self {
                case .character:
                    return "Search Character"
                case .episode:
                    return "Search Episode"
                case .location:
                    return "Search Location"
                }
            }
        }
        let type: `Type`
        
    }
    
    private let config: Config
    
    //MARK: - Init
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.title
        view.backgroundColor = .yellow
    }
}
