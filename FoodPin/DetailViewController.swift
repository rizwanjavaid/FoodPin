//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 10/28/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView:UITableView!
    @IBOutlet weak var restaurantImageView:UIImageView!
    @IBOutlet weak var addRestaurantBarButton:UIBarButtonItem!
    var restaurant:Restaurant!

    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.restaurantImageView.image = UIImage(data: restaurant.image)
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        title = self.restaurant.name
        
        
        // Auto Layout - Self sizing cells
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.3)
        
        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name:"
            cell.valueLabel.text = restaurant.name
            cell.mapButton.hidden = true
        case 1:
            cell.fieldLabel.text = "Type:"
            cell.valueLabel.text = restaurant.type
            cell.mapButton.hidden = true
        case 2:
            cell.fieldLabel.text = "Location:"
            cell.valueLabel.text = restaurant.location
            cell.mapButton.hidden = false
        case 3:
            cell.fieldLabel.text = "Visited:"
            cell.valueLabel.text = (restaurant.isVisited.boolValue) ? "Yes" : "No"
            cell.mapButton.hidden = true
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
            cell.mapButton.hidden = true
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "showMap" {
            let destinationController  = segue.destinationViewController as MapViewController
            // Pass the selected object to the new view controller.
            destinationController.restaurant = restaurant
        }
    }


}
