//
//  APIRequest.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-02-01.
//

import Foundation

enum APIRequest {
    private static let apiKey = "69c9f7b63a0e2fb04261212354b1256d"
    private static let language = "en-US"

    case moviesList(page: Int)
    case movieDetails(id: Int)

    var path: String {
        switch self {
        case .moviesList:
            return "/3/movie/popular"
        case .movieDetails(let id):
            return "/3/movie/\(id)"
        }
    }

    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem(name: "api_key", value: APIRequest.apiKey),
                          URLQueryItem(name: "language", value: APIRequest.language)]

        switch self {
        case .moviesList(let page):
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        case .movieDetails:
            break
        }

        return queryItems
    }

    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        components.queryItems = queryItems

        return components
    }
}
