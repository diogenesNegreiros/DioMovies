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
                        HStack(alignment: .top) {
                            AsyncImage(url: URL(string: movie.posterUrl)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200, height: 120)
                            .cornerRadius(8)
                            .clipped()

                            VStack(alignment: .leading, spacing: 5) {
                                Text(movie.title)
                                    .font(.headline)
                                Text("Ano: \(movie.releaseYear)")
                                    .font(.subheadline)
                                Text("⭐️ \(movie.rating, specifier: "%.1f")")
                                    .font(.subheadline)
                            }
                        }
                        .padding(.vertical, 5)
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
