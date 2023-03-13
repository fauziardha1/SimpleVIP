//
//  PokemonsApiStore.swift
//  SimpleVIP
//
//  Created by Batm Admin on 22/02/23.
//

import Foundation

class PokemonsAPIStore: PokemonsStoreProtocol, PokemonStoreUtilityProtocol{
    func fetchPokemons(completionHandler: @escaping ([Pokemon]?, PokemonsStoreError?) -> Void) {
        BaseNetworkRequest.GET(url: Constant.GET_POKEMONS, header: [String:String]()){
            response in
            
            guard let response = response else {
                completionHandler([], PokemonsStoreError.CannotFetch("bad response"))
                return
            }
            
            do {
                let parsedResponse = try JSONDecoder().decode(ListPokemon.FetchPokemons.Response.self, from: response as! Data)
                completionHandler(parsedResponse.pokemons, nil)
            }catch{
                completionHandler([], PokemonsStoreError.CannotFetch("failed on json decode: \(error)"))
            }
            
        }
    }
    
    func fetchPokemonDetail(pokemon: Pokemon, completionHandler: @escaping (PokemonData?, PokemonDetailStoreError?) -> Void){
        let param = generateDetailParam(id: pokemon.id, name: pokemon.name)
        BaseNetworkRequest.GET(url: Constant.GET_POKEMONS+param, header: [String:String]()){ response in
            guard let response = response else{
                completionHandler(nil, PokemonDetailStoreError.CannotFetch("Bad Response"))
                return
            }
            
            do {
                let parsedResponse = try JSONDecoder().decode(PokemonData.self, from: response as! Data)
                completionHandler(parsedResponse, nil)
            } catch {
                completionHandler(nil, PokemonDetailStoreError.CannotFetch("Failed oon Parsing Data"))
            }
            
        }
    }
    
    
}
