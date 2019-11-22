//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Aaron Shackelford on 11/22/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
        
    }

    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        let movie = self.movies[indexPath.row]
        cell.movieLanding = movie

        return cell
    }
}

extension MovieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        
        MovieController.fetchMovies(searchTerm: searchText) { (result) in
            switch result {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
            }
        }
    }
}
