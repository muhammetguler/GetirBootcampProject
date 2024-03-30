//
//  NewsCell.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 23.03.2024.
//

import UIKit

class NewsCell: UICollectionViewCell {
    func setup(model: News) {
        newsImageView.image = model.imageView
        newsImageViewTitle.text = model.title
        newsImageViewDetail.text = model.detail
    }
    
}
