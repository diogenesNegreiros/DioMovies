//
//  ContentView.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Carregando filmes...")
                } else {
                    List(viewModel.movies) { movie in
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            Text("⭐️ \(movie.rating, specifier: "%.1f")")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Filmes")
            .onAppear {
                viewModel.fetchMovies()
            }
        }
    }
}

#Preview {
    MovieListView()
}
