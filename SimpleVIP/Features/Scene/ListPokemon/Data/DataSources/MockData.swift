//
//  MockData.swift
//  SimpleVIP
//
//  Created by FauziArda on 21/02/23.
//

import Foundation

struct ListPokemonMock{
    struct ResponseMock{
        static let data = {
            var res = []
            for i in 1...10{
                res.append(
                    Pokemon(
                        name: "Pokemon \(i)",
                        urlString: "https://pokeapi.co/api/v2/pokemon/\(i)/"
                    )
                )
            }
            return res
        }
    }
}
