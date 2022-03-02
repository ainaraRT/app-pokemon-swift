//
//  Pokemon.swift
//  pokemonRepaso
//
//  Created by user193642 on 3/1/22.
//

import Foundation

class Pokemon: Mappable {
    var id: Int?
    var name: String?
    var sprites: Sprite?
    var isDefault: Bool?
    
    //nombres de las propiedades ajustadas a la buena práctica
    private enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case id
        case name
        case sprites
    }
}
