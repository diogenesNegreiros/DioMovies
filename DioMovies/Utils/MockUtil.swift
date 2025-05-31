//
//  MockUtil.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 31/05/25.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
}

class MockUtil {
    private init() {}
    
    public static var movie: Movie  {
        return Movie(
            id: "1",
            title: "Inception",
            description: "A skilled thief is offered a chance to have his past crimes forgiven...",
            releaseYear: 2010,
            durationMinutes: 148,
            rating: 8.8,
            posterUrl: "https://i.ytimg.com/vi/YoHD9XEInc0/hq720.jpg",
            trailerUrl: "https://www.youtube.com/embed/YoHD9XEInc0?autoplay=1"
        )
    }
    
}

class MockMovieService: MovieServiceProtocol {
    var shouldReturnError = false
    var moviesToReturn: [Movie] = []

    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "TestError", code: 1, userInfo: nil)))
        } else {
            completion(.success(moviesToReturn))
        }
    }
}
