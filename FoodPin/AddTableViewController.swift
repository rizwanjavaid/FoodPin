//
//  AddTableViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 11/3/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var newRestaurantImageView:UIImageView!
    var restaurant:Restaurant!
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.delegate = self
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        newRestaurantImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        newRestaurantImageView.contentMode = UIViewContentMode.ScaleAspectFill
        newRestaurantImageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
   
}
