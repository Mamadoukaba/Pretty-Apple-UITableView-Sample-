//
//  ProductDetailViewController.swift
//  Pretty Apple
//
//  Created by Mamadou Kaba on 6/20/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var product: Product?
    
    @IBOutlet weak var productImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImageView.image = product?.image
    }
}
