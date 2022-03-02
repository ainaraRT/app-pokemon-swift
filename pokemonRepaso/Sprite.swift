//
//  Sprite.swift
//  pokemonRepaso
//
//  Created by user193642 on 3/1/22.
//

import Foundation

class Sprite: Mappable {
    var backDefault: String?
    var frontDefault: String?
    //como se han puesto las buenas prácticas, hay que poner los nombres que hemos puesto
    //var back_default: String?
    //var front_default: String?
    
    //nombres de las propiedades ajustadas a la buena práctica
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
    }
}
