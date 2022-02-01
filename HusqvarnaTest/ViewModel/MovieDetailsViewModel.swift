//
//  MovieDetailsViewModel.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-02-01.
//

import Foundation

class MovieDetailsViewModel {
    private var apiClient: APIClientProtocol

     var data: Bindable<MovieDetailsViewModelData>

    init(id: Int, apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
        self.data = Bindable(MovieDetailsViewModelData())

        fetchMovieDetails(with: id)
    }

    private func fetchMovieDetails(with id: Int) {
        apiClient.fetchMovieDetails(with: id) { [weak self] movie in
            self?.updateData(with: movie)
        }
    }

    private func updateData(with movie: Movie) {
        var data = MovieDetailsViewModelData(title: movie.title,
                                             originalTitle: movie.original_title,
                                             releaseDate: movie.release_date)

        if let tagline = movie.tagline {
            data.tagline = tagline
        }

        if let runtime = movie.runtime {
            let hours = runtime / 60
            let minutes = runtime % 60

            data.runtime = String(format: "%02d:%02d", hours, minutes)
        }

        if let status = movie.status {
            data.status = status
        }

        if let budget = movie.budget {
            data.budget = String(describing: budget)
        }

        if let revenue = movie.revenue {
            data.revenue = String(describing: revenue)
        }

        self.data.update(with: data)
    }
}

struct MovieDetailsViewModelData {
    var title = "Loading..."
    var originalTitle: String? = "-"
    var tagline: String? = "-"
    var runtime: String?
    var status: String? = "-"
    var releaseDate: String? = "-"
    var budget: String? = "-"
    var revenue: String? = "-"
}
