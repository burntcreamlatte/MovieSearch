//
//  Movie.swift
//  MovieSearch
//
//  Created by Aaron Shackelford on 11/22/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

//https://api.themoviedb.org/3/search/movie?api_key=db2916b46a4319f5aa22a803f48226ac&query=The+Big+Lebowski
import Foundation


struct TopLevelSearchDict: Codable {
    let results: [Movie]
}
struct Movie: Codable {
    let posterPath: String //poster_path
    let originalTitle: String //original_title
    let voteAverage: Double //vote_average
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case overview
    }
}
