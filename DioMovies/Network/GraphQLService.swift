//
//  GraphQLService.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
// Mock do serviço

import Foundation

class GraphQLService {
    static let shared = GraphQLService()

    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) { //Simula 1.5s de "latência"
            guard let url = Bundle.main.url(forResource: "filmes", withExtension: "json") else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "Arquivo não encontrado", code: 404)))
                }
                return
            }

            do {
                let data = try Data(contentsOf: url)
                let decoded = try JSONDecoder().decode(GraphQLResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded.data.movies))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}

struct GraphQLResponse: Codable {
    let data: MovieData
}

struct MovieData: Codable {
    let movies: [Movie]
}
