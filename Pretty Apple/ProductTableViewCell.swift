//
//  ProductTableViewCell.swift
//  Pretty Apple
//
//  Created by Mamadou Kaba on 6/19/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
     //MARK: - Helper Methods
    func configureCellWith(product: Product) {
        productImageView.image = product.image
        productTitleLabel.text = product.title
        productDescriptionLabel.text = product.description
        
    }
}
