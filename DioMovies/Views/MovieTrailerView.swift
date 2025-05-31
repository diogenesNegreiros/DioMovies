//
//  MovieTrailerView.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
//

import SwiftUI

struct MovieTrailerView: View {
    var mov: Movie
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Trailer:")
                .font(.headline)
                .foregroundColor(.white)
            
            if let trailerURL = URL(string: mov.trailerUrl) {
                WebView(url: trailerURL)
                    .frame(height: 200)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    let mockMovie = Movie(
        id: "1",
        title: "Inception",
        description: "A skilled thief is offered a chance to have his past crimes forgiven...",
        releaseYear: 2010,
        durationMinutes: 148,
        rating: 8.8,
        posterUrl: "https://i.ytimg.com/vi/YoHD9XEInc0/hq720.jpg",
        trailerUrl: "https://www.youtube.com/embed/YoHD9XEInc0?autoplay=1"
    )
    ZStack {
        Color.black.ignoresSafeArea()
        MovieTrailerView(mov: mockMovie)
    }
}
