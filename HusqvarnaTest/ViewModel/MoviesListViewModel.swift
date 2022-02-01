//
//  MoviesListViewModel.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-01-30.
//

import Foundation

protocol MoviesListProtocol {
    var numberOfRows: Int { get }
    var onMoviesFetched: (() -> Void)? { get set }

    func fetchMovies()
    func getMovieID(at index: Int) -> Int
    func getPosterURL(at index: Int) -> URL?
}

class MoviesListViewModel: MoviesListProtocol {
    var onMoviesFetched: (() -> Void)?

    private let apiClient: APIClientProtocol

    private var movies: [Movie] = []
    private var page: Int = 1

    var numberOfRows: Int {
        movies.count
    }

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchMovies() {
        // Right now apiClient only returns list of movies
        // If needed error can also be returned to pass it further to view and do some actions there
        apiClient.fetchMoviesList(at: page) { [weak self] movies in
            guard let self = self else { return }

            self.movies.append(contentsOf: movies)
            self.page += 1
            self.onMoviesFetched?()
        }
    }

    func getMovieID(at index: Int) -> Int {
        return movies[index].id
    }

    func getPosterURL(at index: Int) -> URL? {
        let posterPath = movies[index].poster_path

        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")
    }
}
