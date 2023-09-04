//
//  RMEpisodeModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 12.08.2023.
//

import Foundation

// MARK: - RMEpisode
struct RMEpisode: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
}
