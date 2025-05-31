//
//  MockUtil.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 31/05/25.
//

import Foundation

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
