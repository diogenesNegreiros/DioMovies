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
    @State private var showError = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                if viewModel.isLoading {
                    ProgressView("loading_movies")
                        .foregroundColor(.white)
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieItemList(mov: movie)
                        }
                        .listRowBackground(Color.black)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("movie_title_label")
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
             .onReceive(viewModel.$errorMessage) { error in
                 showError = error != nil
             }
             .alert(isPresented: $showError) {
                 Alert(
                     title: Text("movie_error"),
                     message: Text(viewModel.errorMessage ?? "movie_error_msg"),
                     dismissButton: .default(Text("OK")) {
                         viewModel.errorMessage = nil
                     }
                 )
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


