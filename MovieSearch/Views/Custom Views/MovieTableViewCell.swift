//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Aaron Shackelford on 11/22/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    var movieLanding: Movie? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        
    }
}
