//
//  MovieListViewModel.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: MovieServiceProtocol

    init(service: MovieServiceProtocol = GraphQLService.shared) {
        self.service = service
    }

    func fetchMovies() {
        isLoading = true
        service.fetchMovies { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let movies):
                    self?.movies = movies
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}



