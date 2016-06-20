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
    
    
    func configureCellWith(product: Product) {
        productImageView.image = product.image
        productTitleLabel.text = product.title
        productDescriptionLabel.text = product.description
        
    }
}
