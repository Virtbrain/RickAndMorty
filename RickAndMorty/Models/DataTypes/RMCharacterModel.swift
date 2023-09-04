//
//  RMCharacterModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 12.08.2023.
//

import Foundation

//MARK: - RMCaracter
struct RMCharacter: Codable {
    let id: Int
    let name, species, type: String
    let status: RMCharacterStatus
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
