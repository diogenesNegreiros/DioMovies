//
//  MovieInfoView.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
//

import SwiftUI

struct MovieInfoView: View {
    var mov: Movie
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: mov.posterUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            Text(mov.title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            Text(mov.description)
                .font(.body)
                .foregroundColor(.white)
            
            HStack {
                Text("Ano: \(mov.releaseYear)")
                Text("Duração: \(mov.durationMinutes) min")
                Text("⭐️ \(mov.rating, specifier: "%.1f")/10")
            }
            .foregroundColor(.gray)
            .font(.subheadline).background(Color.black)
        }
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
        MovieInfoView(mov: mockMovie)
    }
}
