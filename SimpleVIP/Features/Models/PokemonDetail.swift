//
//  PokemonDetail.swift
//  SimpleVIP
//
//  Created by FauziArda on 22/02/23.
//

import Foundation

// MARK: - PokemonData
struct PokemonData: Codable {
    let abilities: [Ability]
    let height, id: Int
    let moves: [Move]
    var name: String
    let species: Species
    let types: [TypeElement]
    let weight: Int
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: - Move
struct Move: Codable {
    let move: Species
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let type: Species
}
