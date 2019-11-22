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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateViews() {
        
    }
}
