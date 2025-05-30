//
//  ContentView.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel = MovieListViewModel()
    @State private var hasAppeared = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                if viewModel.isLoading {
                    ProgressView("Carregando filmes...")
                        .foregroundColor(.white)
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieView(mov: movie)
                        }
                        .listRowBackground(Color.black)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("🎬 Filmes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Ícone tocado")
                    }) {
                        Image(systemName: "film")
                            .foregroundColor(.white)
                    }
                }
            }
            .onAppear {
                if !hasAppeared {
                    viewModel.fetchMovies()
                    hasAppeared = true
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    init() {
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    MovieListView()
}

struct MovieView: View {
    var mov: Movie
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: mov.posterUrl)) { image in
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
                Text(mov.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Ano: \(mov.releaseYear)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("⭐️ \(mov.rating, specifier: "%.1f")")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 5)
    }
}
