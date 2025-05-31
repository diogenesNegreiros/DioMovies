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
    ZStack {
        Color.black.ignoresSafeArea()
        MovieInfoView(mov: MockUtil.movie)
    }
}
