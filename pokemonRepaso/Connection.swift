//
//  Connection.swift
//  pokemonRepaso
//
//  Created by user193642 on 3/1/22.
//

import UIKit

class Connection{
    let baseURLString = "https://pokeapi.co/api/v2/pokemon/"
    
    func getPokemon(withId id: Int/*, method: String, params: [AnyHashable: Any]*/, completion: @escaping (_ pokemon: Pokemon?) -> Void) {
        guard let url = URL(string: baseURLString + "\(id)/") else {
            completion(nil)
            return
        }
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            
            if error == nil, let data = data {
                let pokemon = Pokemon(withJsonData: data)
                completion(pokemon)
            }
            else {
                completion(nil)
            }
        }
        task.resume() //iniciar o ejecutar la conexion al servidor
    }
    
    func getSprite(withURLString urlString: String, completion: @escaping(_ image: UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            
            if error == nil, let data = data {
                let image = UIImage(data: data)
                completion(image)
            }
            else {
                completion(nil)
            }
        }
        task.resume() //iniciar o ejecutar la conexion al servidor
    }
}
