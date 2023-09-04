//
//  RMLocationModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 12.08.2023.
//

import Foundation

// MARK: - RMLocation
struct RMLocation: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
