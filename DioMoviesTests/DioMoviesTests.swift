//
//  DioMoviesTests.swift
//  DioMoviesTests
//
//  Created by Diogenes de Souza Negreiros on 30/05/25.
// Auxilio de IA para melhorar a cobertura do teste.

import XCTest
@testable import DioMovies

final class MovieListViewModelTests: XCTestCase {

    func testFetchMoviesSuccess() {
        // Dado um serviço simulado que retorna filmes com sucesso
        let mockService = MockMovieService()
        mockService.moviesToReturn = [
            Movie(id: "1", title: "Filme Teste", description: "Descrição teste", releaseYear: 2022, durationMinutes: 120, rating: 8.0, posterUrl: "", trailerUrl: "")
        ]
        let viewModel = MovieListViewModel(service: mockService)

        // Quando a função de busca for chamada
        viewModel.fetchMovies()

        // Então deve carregar os filmes corretamente e não apresentar erro
        let expectation = XCTestExpectation(description: "Aguardar resposta da busca de filmes")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertFalse(viewModel.isLoading, "O carregamento deve estar finalizado")
            XCTAssertEqual(viewModel.movies.count, 1, "Deve haver exatamente um filme retornado")
            XCTAssertNil(viewModel.errorMessage, "Não deve haver mensagem de erro")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testFetchMoviesFailure() {
        // Dado um serviço simulado que retorna um erro
        let mockService = MockMovieService()
        mockService.shouldReturnError = true
        let viewModel = MovieListViewModel(service: mockService)

        // Quando a função de busca for chamada
        viewModel.fetchMovies()

        // Então deve apresentar uma mensagem de erro e não carregar nenhum filme
        let expectation = XCTestExpectation(description: "Aguardar resposta da busca com erro")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertFalse(viewModel.isLoading, "O carregamento deve estar finalizado")
            XCTAssertTrue(viewModel.movies.isEmpty, "A lista de filmes deve estar vazia")
            XCTAssertNotNil(viewModel.errorMessage, "Deve haver uma mensagem de erro")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
