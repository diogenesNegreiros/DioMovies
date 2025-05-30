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

    func fetchMovies() {
        isLoading = true
        GraphQLService.shared.fetchMovies { result in
            self.isLoading = false
            switch result {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}



