//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 10/26/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit
import CoreData

class RestaurantTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchResultsUpdating {
    
    // Declare instance variables
    var searchController: UISearchController!
    var restaurants:[Restaurant] = []
    var fetchResultController:NSFetchedResultsController!
    var searchResults:[Restaurant] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.hidesBarsOnSwipe = true
        
        // Fetching Data Using Core Data
        var fetchRequest = NSFetchRequest(entityName: "Restaurant")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext {
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            var e:NSError?
            var result = fetchResultController.performFetch(&e)
            restaurants = fetchResultController.fetchedObjects as [Restaurant]
    
            if result != true {
                println(e?.localizedDescription)
            }
            
        }
        
    
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Empty back button title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        
        // Auto Layout - Self sizing cells
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: 320, height: 42)
        searchController.searchBar.barTintColor = UIColor(red:231.0/255.0, green: 95.0/255.0, blue: 53.0/255.0, alpha: 1.0)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if searchController.active {
            return searchResults.count
        } else {
            return self.restaurants.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CustomTableViewCell

        // Configure the cell...
        let restaurant = (searchController.active) ? searchResults[indexPath.row] : restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.thumbnailImageView.image = UIImage(data:restaurant.image)
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        
        
        // Add a circle mask to the Restaurant image
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
        
            // Delete the row from the data source
            self.restaurants.removeAtIndex(indexPath.row)
            
            println("Total item: \(self.restaurants.count)")
            for name in restaurants{
                println(name)
            }
            
            //self.tableView.reloadData()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if searchController.active {
            return false
        } else {
            return true
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
        
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete",handler: {
            (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            // Delete the row from the data source
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext {
                
                let restaurantToDelete = self.fetchResultController.objectAtIndexPath(indexPath) as Restaurant
                managedObjectContext.deleteObject(restaurantToDelete)
                
                var e: NSError?
                if managedObjectContext.save(&e) != true {
                    println("delete error: \(e!.localizedDescription)")
                }
            }
            
        })
        
        shareAction.backgroundColor = UIColor(hue: 212.0/360.0, saturation: 67.0/100.0, brightness: 89.0/100.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(hue: 353.0/360.0, saturation: 99.0/100.0, brightness: 82.0/100.0, alpha: 1.0)
        
        return[deleteAction, shareAction]
        
    }
    
    
    // When there is any content change, the following methods of the NSFetchedResultsControllerDelegate will be called:
    func controllerWillChangeContent(controller: NSFetchedResultsController!) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController!, didChangeObject anObject: AnyObject!, atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath!) {
        
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        case .Update:
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            tableView.reloadData()
        
        }
        
        restaurants = controller.fetchedObjects as [Restaurant]
        
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        tableView.endUpdates()
    }
    
    func filterContentForSearchText(searchText: String) {
        
        searchResults = restaurants.filter({ (restaurant:Restaurant) -> Bool in
        
            let nameMatch = restaurant.name.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let locationMatch = restaurant.location.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let typeMatch  = restaurant.type.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            return nameMatch != nil || locationMatch != nil || typeMatch != nil
        
        
        })
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        
        filterContentForSearchText(searchText)
        tableView.reloadData()
    }
    
    
    
    
    
    // Function to prepare variables to be sent to the DetailViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Check for the correct Seque identifier
        if segue.identifier == "showRestaurantDetail" {
            
            // Set the indexPath to be the row selected
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                
                // Create a constant for the DetailViewController
                let destinationController = segue.destinationViewController as DetailViewController
                
                // Pass the selected restaurant instance to the destination controller restaurant variable
                destinationController.restaurant = (searchController.active) ? searchResults[indexPath.row] : restaurants[indexPath.row]
                
            }
        
        }
    }
    
    
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
        
    }
    
}
