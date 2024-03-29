//
//  MovieController.swift
//  MovieSearch
//
//  Created by Aaron Shackelford on 11/22/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

//importing UIKit for UIImage as UIKit contains foundation; could only import UIKit.UIImage along with Foundation but with the extent of this app either is fine
import UIKit

class MovieController {
    
    //MARK: - Fetching movies function
    static func fetchMovies(searchTerm: String, completion: @escaping (Result<[Movie], MovieAPIError>) -> Void) {
        guard let baseURL = URL(string: URLConstant.baseURL) else { completion(.failure(.invalidURL)); return }
        let movieComponentURL = baseURL.appendingPathComponent("3").appendingPathComponent(URLConstant.searchComponent).appendingPathComponent(URLConstant.movieComponent)
        guard var urlComponents = URLComponents(url: movieComponentURL, resolvingAgainstBaseURL: true) else { completion(.failure(.invalidURL)); return }
        let apiKeyQuery = URLQueryItem(name: URLConstant.apiQuery, value: URLConstant.apiKey)
        let movieQuery = URLQueryItem(name: URLConstant.movieQuery, value: searchTerm)
        
        urlComponents.queryItems = [apiKeyQuery, movieQuery]
        
        guard let finalURL = urlComponents.url else { completion(.failure(.invalidURL)); return }
        print(finalURL)
        
        
        // MARK: Data tasking
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
                completion(.failure(.communicationError)); return
            }
            guard let data = data else { completion(.failure(.noData)); return }
            
            do {
                let moviesDecoded = try JSONDecoder().decode(TopLevelSearchDict.self, from: data)
                return completion(.success(moviesDecoded.results))
            } catch {
                print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
            }
        }.resume()
        
    }
    static func fetchPosterAndUpdateUI(for movie: Movie, completion: @escaping (Result<UIImage, MovieAPIError>) -> Void) {
        guard let url = URL(string: URLConstant.imageURL) else { completion(.failure(.invalidURL)); return }
        let finalImageURL = url.appendingPathComponent(movie.posterPath)
        print(finalImageURL)
        URLSession.shared.dataTask(with: finalImageURL) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
                    completion(.failure(.communicationError)); return
                }
                guard let data = data else { completion(.failure(.noData)); return }
                guard let posterImage = UIImage(data: data) else { completion(.failure(.unableToDecode)); return }
                completion(.success(posterImage))
            }
        }.resume()
    }
    enum MovieAPIError: LocalizedError {
        case invalidURL
        case communicationError
        case noData
        case noMovies
        case unableToDecode
    }
}
    

