//
//  RMSettingsViewController.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 12.08.2023.
//

import UIKit

/// Controller to show various app otions and settings
final class RMSettingsViewController: UIViewController {
    
    private let viewModel = RMSettingsViewViewModel(
        cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0)
        })
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
    }

}
