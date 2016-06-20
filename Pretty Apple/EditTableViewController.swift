//
//  EditTableViewController.swift
//  Pretty Apple
//
//  Created by Mamadou Kaba on 6/20/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    var product: Product?
    
    //MARK: - IBOutlets
    @IBOutlet weak var ProductImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductImageView.image = product?.image
        productTitleTextField.text = product?.title
        productDescriptionTextView.text = product?.description
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        product?.title = productTitleTextField.text!
        product?.image = ProductImageView.image!
        product?.description = productDescriptionTextView.text!
    }
    
    //MARK: - UITextFieldDelegate
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let textField = productTitleTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //MARK: - UIScrollViewDelegate
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        productDescriptionTextView.resignFirstResponder()
    }
}
