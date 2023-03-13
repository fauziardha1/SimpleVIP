//
//  Pokemon.swift
//  SimpleVIP
//
//  Created by Batm Admin on 21/02/23.
//

import Foundation

struct Pokemon: Decodable {
    
    var name: String
    var urlString: String
    var imageUrl: String {
        let number = urlString.replacingOccurrences(of: Constant.GET_POKEMONS, with: "")
                .replacingOccurrences(of: "/", with: "")
        return "\(Constant.IMG_BASE)\(number).png"
        }
    var id: Int {
        let number = urlString.replacingOccurrences(of: Constant.GET_POKEMONS, with: "")
            .replacingOccurrences(of: "/", with: "")
        return Int(number)!
    }
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case urlString = "url"
    }
}
