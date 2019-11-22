//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Aaron Shackelford on 11/22/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movieLanding: Movie? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        //how do developers keep track of landing pads when every other object has the exact same name based on convention?? movie = movie on 12 lines is a dyslexic's nightmare
        guard let movie = movieLanding else { return }
        MovieController.fetchPosterAndUpdateUI(for: movie) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let poster):
                    self.posterImageView.image = poster
                case .failure(let error):
                    print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
                }
                self.movieTitleLabel.text = movie.originalTitle
                self.movieRatingLabel.text = "Average Score: \(movie.voteAverage)"
                self.movieDescLabel.text = movie.overview
            }
        }
    }
}
