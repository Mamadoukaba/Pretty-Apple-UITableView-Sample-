//
//  AppleProductsTableViewController.swift
//  Pretty Apple
//
//  Created by Mamadou Kaba on 6/16/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class AppleProductsTableViewController: UITableViewController {
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        navigationItem.rightBarButtonItem = editButtonItem()
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    //MARK: - Data Source
    
    lazy var productLines: [ProductLine] = {
        return ProductLine.productLines()
    }()
 
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productLine = productLines[section]
        return productLine.name
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return productLines.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let productLine = productLines[section]
        return productLine.products.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Product Cell", forIndexPath: indexPath) as! ProductTableViewCell

        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]
        
        cell.configureCellWith(product)

        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let productline = productLines[indexPath.section]
            productline.products.removeAtIndex(indexPath.row)
            //Tell the table view that we just modified the Data Source
            //tableView.reloadData()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "Show Detail":
                    let productDetailVC = segue.destinationViewController as! ProductDetailViewController
                    if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                        productDetailVC.product = productAtIndexPath(indexPath)
                }
                
                case "Show Edit":
                    let editTableVC = segue.destinationViewController as! EditTableViewController
                    if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                        editTableVC.product = productAtIndexPath(indexPath)
                }
                
                default: break
            }
        }
    }
    
    //MARK: - Helper Method
    func productAtIndexPath(indexPath: NSIndexPath) -> Product {
        let productLine = productLines[indexPath.section]
        return productLine.products[indexPath.row]
    }
}
