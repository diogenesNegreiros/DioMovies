//
//  Movie.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let releaseYear: Int
    let durationMinutes: Int
    let rating: Double
    let posterUrl: String
    let trailerUrl: String
}
