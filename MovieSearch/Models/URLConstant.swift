//
//  URLConstant.swift
//  MovieSearch
//
//  Created by Aaron Shackelford on 11/22/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import Foundation

struct URLConstant: Codable {
    static let baseURL = "https://api.themoviedb.org/"
    static let imageURL = "http://image.tmdb.org/t/p/w500/"
    static let searchComponent = "search"
    static let movieComponent = "movie"
    static let movieQuery = "query"
    static let apiQuery = "api_key"
    static let apiKey = "db2916b46a4319f5aa22a803f48226ac"
}
