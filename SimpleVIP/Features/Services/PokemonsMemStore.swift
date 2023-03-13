//
//  PokemonsMemStore.swift
//  SimpleVIP
//
//  Created by FauziArda on 22/02/23.
//

import Foundation

class PokemonsMemStore: PokemonsStoreProtocol, PokemonStoreUtilityProtocol {
    static var pokemons: [Pokemon] = [
        Pokemon( name: "bulbasaur", urlString: "https://pokeapi.co/api/v2/pokemon/1/"),
        Pokemon( name: "ivysaur", urlString: "https://pokeapi.co/api/v2/pokemon/2/"),
    ]
    
    static var pokeDetail = PokemonData(abilities: [Ability(ability: Species(name: "pocket monster", url: ""), isHidden: false, slot: 1)], height: 10, id: 0, moves: [Move(move: Species(name: "move", url: ""))], name: "moster", species: Species(name: "monster", url: ""), types: [TypeElement(type: Species(name: "monster", url: ""))], weight: 100)
    
    func fetchPokemons(completionHandler: @escaping ([Pokemon]?, PokemonsStoreError?) -> Void) {
        completionHandler(type(of: self).pokemons, nil)
    }
    
    func fetchPokemonDetail(pokemon: Pokemon, completionHandler: @escaping (PokemonData?, PokemonDetailStoreError?) -> Void) {
        completionHandler(type(of: self).pokeDetail, nil)
    }
    
    
}
