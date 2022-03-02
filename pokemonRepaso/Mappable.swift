//
//  Mappable.swift
//  pokemonRepaso
//
//  Created by user193642 on 3/1/22.
//

import Foundation

protocol Mappable: Codable {
    init?(withJsonData: Data?)
}

extension Mappable {
    init?(withJsonData: Data?) {
        guard let data = withJsonData else { return nil }
        do {
            self = try JSONDecoder().decode(Self.self, from: data)
        }
        catch {
            return nil
        }
    }
}
