//
//  Movie.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-01-30.
//

import Foundation

struct List: Codable {
    var results: [Movie]
}

struct Movie: Codable {
    var id: Int
    var title: String
    var poster_path: String

    // Not used
    var genre_ids: [Int]?
    var adult: Bool
    var backdrop_path: String
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Float
    var release_date: String
    var video: Bool
    var vote_average: Float
    var vote_count: Int

    // Movie details
    var belong_to_collection: Collection?
    var genres: [Genre]?
    var budget: Int?
    var homepage: String?
    var imdb_id: String?
    var production_companies: [ProductionCompany]?
    var production_countries: [ProductionCountry]?
    var revenue: Int?
    var runtime: Int?
    var spoken_languages: [SpokenLanguage]?
    var status: String?
    var tagline: String?
}

struct Collection: Codable {
    var id: Int
    var name: String
    var poster_path: String
    var backdrop_path: String
}

struct Genre: Codable {
    var id: Int
    var name: String
}

struct ProductionCompany: Codable {
    var id: Int
    var logo_path: String
    var name: String
    var origin_country: String
}

struct SpokenLanguage: Codable {
    var english_name: String
    var iso_639_1: String
    var name: String
}

struct ProductionCountry: Codable {
    var iso_3166_1: String
    var name: String
}
