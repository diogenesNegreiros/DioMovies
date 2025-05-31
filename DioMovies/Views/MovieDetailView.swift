//
//  MovieDetailView.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
//

import SwiftUI
import WebKit

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                MovieInfoView(mov: movie)
                MovieTrailerView(mov: movie)
            }
        }
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    NavigationView {
        MovieDetailView(movie: MockUtil.movie)
    }
}




