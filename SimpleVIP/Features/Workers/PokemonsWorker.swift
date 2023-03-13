//
//  PokemonsWorker.swift
//  SimpleVIP
//
//  Created by FauziArda on 21/02/23.
//

import Foundation

class PokemonsWorker{
    var pokemonsStore : PokemonsStoreProtocol
    
    init(pokemonsStore: PokemonsStoreProtocol) {
        self.pokemonsStore = pokemonsStore
    }
    
    func fetchPokemons(completionHandler: @escaping ([Pokemon])->Void ){
        pokemonsStore.fetchPokemons {  pokemons, error in
            guard let pokemons = pokemons, error == nil else{
                completionHandler([])
                return
            }
            
            // if there is no error, then return completion handler with data
            completionHandler(pokemons)
        }
    }
    
    func fetchPokemonDetail(pokemon: Pokemon, CompletionHandler: @escaping (PokemonData?)-> Void){
        pokemonsStore.fetchPokemonDetail(pokemon: pokemon){ pokemonDetail, error in
            guard let pokeDetail = pokemonDetail, error == nil else {
                CompletionHandler(nil)
                return
            }
            
            CompletionHandler(pokeDetail)
            
        }
    }
    
}

protocol PokemonStoreUtilityProtocol{
}

extension PokemonStoreUtilityProtocol{
    func generateDetailParam(id: Int = 0, name: String = "") -> String{
        return id == 0 ? name : String(id)
    }
}


protocol PokemonsStoreProtocol {
    func fetchPokemons(completionHandler: @escaping ( [Pokemon]?,PokemonsStoreError? )-> Void )
    func fetchPokemonDetail(pokemon: Pokemon, completionHandler: @escaping ( PokemonData?, PokemonDetailStoreError? )-> Void )
}


enum PokemonsStoreError{
    case CannotFetch(String)
}

enum PokemonDetailStoreError{
    case CannotFetch(String)
}
