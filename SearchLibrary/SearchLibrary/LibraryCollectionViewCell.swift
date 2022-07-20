//
//  LibraryCollectionViewCell.swift
//  SearchLibrary
//
//  Created by Seo Jae Hoon on 2022/07/20.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRateLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
  
   
    func configureCell(data: Movie) {
        
        movieTitleLabel.text = data.title
        movieTitleLabel.font = .boldSystemFont(ofSize: 18)
        movieTitleLabel.textColor = .white
        
        movieRateLabel.text = "\(data.rate)"
        movieRateLabel.font = .systemFont(ofSize: 14)
        movieRateLabel.textColor = .white
        
        movieImageView.image = UIImage(named: "\(data.title).jpg")
        
    }
    
    
}
