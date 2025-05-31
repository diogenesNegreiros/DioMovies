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

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = UIColor.darkGray
        webView.scrollView.backgroundColor = UIColor.darkGray
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
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




