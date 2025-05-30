//
//  MovieDetailView.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: movie.posterUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                    Text(movie.description)
                        .font(.body)
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Ano: \(movie.releaseYear)")
                        Text("Duração: \(movie.durationMinutes) min")
                        Text("⭐️ \(movie.rating, specifier: "%.1f")/10")
                    }
                    .foregroundColor(.gray)
                    .font(.subheadline)
                }
                .padding()
            }
        }
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
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
    NavigationView {
        MovieDetailView(movie: mockMovie)
    }
}
