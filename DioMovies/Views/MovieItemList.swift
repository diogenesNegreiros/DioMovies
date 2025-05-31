//
//  MovieItemList.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 31/05/25.
//

import SwiftUI

struct MovieItemList: View {
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

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        MovieItemList(mov: MockUtil.movie)
    }
}
