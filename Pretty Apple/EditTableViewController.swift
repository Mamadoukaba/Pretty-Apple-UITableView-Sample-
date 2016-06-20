//
//  EditTableViewController.swift
//  Pretty Apple
//
//  Created by Mamadou Kaba on 6/20/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Properties
    var product: Product?
    
    //MARK: - IBOutlets
    @IBOutlet weak var ProductImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Product"
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
    
    //MARK: - Table View Interaction
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.section == 0 && indexPath.row == 0 {
            return indexPath
        } else {
            return nil
        }
    }
    
    //MARK: - ImagePickerView
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let picker = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary //.camera
            picker.allowsEditing = false
            picker.delegate = self
            presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        product?.image = image
        ProductImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
}
