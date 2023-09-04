//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 04.09.2023.
//

import Foundation

enum RMCaracterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
