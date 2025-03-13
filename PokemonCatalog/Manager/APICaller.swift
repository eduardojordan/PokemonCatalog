//
//  APICaller.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 12/3/25.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    func getPokemon(completion: @escaping (Result<[PokemonModel], Error>) -> Void) {
        guard let url = URL(string: Constants.baseURL) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            
            if let cleanedData = data.parseData(removeString: "null,") {
                do {
                    let result = try JSONDecoder().decode([PokemonModel].self, from: cleanedData)
                    completion(.success(result))
                } catch {
                    completion(.failure(APIError.decodingError))
                    print("Error al decodificar los datos: \(error.localizedDescription)")
                }
            } else {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
