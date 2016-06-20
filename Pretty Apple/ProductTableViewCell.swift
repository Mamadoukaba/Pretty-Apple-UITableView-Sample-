//
//  ProductTableViewCell.swift
//  Pretty Apple
//
//  Created by Mamadou Kaba on 6/19/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var ratingImage0: UIImageView!
    @IBOutlet weak var ratingImage1: UIImageView!
    @IBOutlet weak var ratingImage2: UIImageView!
    @IBOutlet weak var ratingImage3: UIImageView!
    @IBOutlet weak var ratingImage4: UIImageView!
    
    
    func configureCellWith(product: Product) {
        productImageView.image = product.image
        productTitleLabel.text = product.title
        productDescriptionLabel.text = product.description
        ratingLabel.text = "Rating"
        ratingImage0.image = UIImage(named: "star_uns.png")
        ratingImage1.image = UIImage(named: "star_uns.png")
        ratingImage2.image = UIImage(named: "star_uns.png")
        ratingImage3.image = UIImage(named: "star_uns.png")
        ratingImage4.image = UIImage(named: "star_uns.png")
    }
}
