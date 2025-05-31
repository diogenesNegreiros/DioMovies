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
    ZStack {
        Color.black.ignoresSafeArea()
        MovieTrailerView(mov: MockUtil.movie)
    }
}
