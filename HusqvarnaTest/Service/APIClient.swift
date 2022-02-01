//
//  APIClient.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-01-30.
//

import Foundation
import Alamofire

protocol APIClientProtocol {
    func fetchMoviesList(at page: Int, completion: @escaping ([Movie]) -> Void)
    func fetchMovieDetails(with id: Int, completion: @escaping (Movie) -> Void)
}

class APIClient: APIClientProtocol {
    func fetchMoviesList(at page: Int, completion: @escaping ([Movie]) -> Void) {
        makeRequest(for: .moviesList(page: page)) {(result: Result<List, Error>) in
            switch result {
            case .success(let list):
                completion(list.results)
            case .failure(_):
                // Implement error handling for movies list fetching
                break
            }
        }
    }

    func fetchMovieDetails(with id: Int, completion: @escaping (Movie) -> Void) {
        makeRequest(for: .movieDetails(id: id)) { (result: Result<Movie, Error>) in
            switch result {
            case .success(let movie):
                completion(movie)
            case .failure(_):
                // Implement movie details fetching error handling
                break
            }
        }
    }

    private func makeRequest<T: Decodable>(for request: APIRequest, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(request.urlComponents).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
