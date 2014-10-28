//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 10/26/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames:[String] = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages:[String] = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations:[String] = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London","London", "London"]
    
    var restaurantTypes:[String] = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink",
        "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American",
        "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited:[Bool] = [Bool](count: 21, repeatedValue: false)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return restaurantNames.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CustomTableViewCell

        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named:restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        cell.accessoryType =
            restaurantIsVisited[indexPath.row] ? .Checkmark : .None
        
        // Circular image
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Create an option menu as an Action Sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        
        // Add Actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // Add Call Action
        let callAction = UIAlertAction(title: "Call 123-123-10\(indexPath.row)", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available. Please try again later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            alertMessage.addAction(UIAlertAction(title: "Settings", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
            
            })
        optionMenu.addAction(callAction)
        
        // Check to see if the cell is already checked. If it isn't then add the checkmark. If it is checked then remove the checkmark.
        if restaurantIsVisited[indexPath.row] == false {
            
            // Add Visited Action
            let visitedAction = UIAlertAction(title: "I've been here!", style: .Default, handler: {
                (action:UIAlertAction!) -> Void in
                
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = .Checkmark
                
                self.restaurantIsVisited[indexPath.row] = true
            
                
                })
            optionMenu.addAction(visitedAction)
         
        } else {
            
            // Remove Visited Action
            let removeVisitedAction = UIAlertAction(title: "Remove visited label", style: .Default, handler: {
                (action:UIAlertAction!) -> Void in
                
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = .None
                
                })
            optionMenu.addAction(removeVisitedAction)
            
        }
        
        // Display the menu
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
        
            // Delete the row from the data source
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            
            println("Total item: \(self.restaurantNames.count)")
            for name in restaurantNames{
                println(name)
            }
            
            //self.tableView.reloadData()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
        
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {(action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            
            }
        )
        
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            // Delete the row from the data source
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            
//            println("Total item: \(self.restaurantNames.count)")
//            for name in restaurantNames{
//                println(name)
//            }
            
            //self.tableView.reloadData()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
          
            })
        
        shareAction.backgroundColor = UIColor(hue: 212.0/360.0, saturation: 67.0/100.0, brightness: 89.0/100.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(hue: 353.0/360.0, saturation: 99.0/100.0, brightness: 82.0/100.0, alpha: 1.0)
        
        return[deleteAction, shareAction]
        
    }
    
    
    
    
    
    
}
