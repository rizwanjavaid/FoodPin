//
//  AddTableViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 11/3/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var newRestaurantImageView:UIImageView!
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var typeTextField:UITextField!
    @IBOutlet weak var locationTextField:UITextField!
    @IBOutlet weak var yesButton:UIButton!
    @IBOutlet weak var noButton:UIButton!
    var restaurant:Restaurant!
    var isVisited:Bool = true
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        nameTextField.becomeFirstResponder()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
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
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
    }
    
    
    @IBAction func close(segue:UIStoryboardSegue){
        
    }

    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        
        // Form Validation
        var errorField = ""
        
        if nameTextField.text == "" {
            errorField = "Name"
        } else if typeTextField.text == "" {
            errorField = "Type"
        } else if locationTextField.text == "" {
            errorField = "Location"
        }
        
        if errorField != "" {
        
            let alertController = UIAlertController(title: "Error", message: "Please fill in the the Restaurant " + errorField + " All fields are required", preferredStyle: .Alert)
            let doneAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(doneAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        
        // If all fields are filled in correctly, extract the field values
        println("Name" + self.nameTextField.text)
        println("Type" + self.typeTextField.text)
        println("Location" + self.locationTextField.text)
        println("Have you been here" + (isVisited ? "yes" : "no" ))
        
        // Execute the unwind segue once the values have been extracted
        performSegueWithIdentifier("unwindToHomeScreen", sender: self)
        
    }
    
    @IBAction func updateButtonPressed(sender: AnyObject) {
    
        // Yes button pressed
        let buttonClicked = sender as UIButton
        if buttonClicked == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor(red: 255.0/255.0, green: 107.0/255.0, blue: 101.0/255.0, alpha: 1.0)
            noButton.backgroundColor = UIColor(red: 195.0/255.0, green: 187.0/255.0, blue: 186.0/255.0, alpha: 1.0)
        } else if buttonClicked == noButton {
            // No Button Pressed
            isVisited = false
            yesButton.backgroundColor = UIColor(red: 195.0/255.0, green: 187.0/255.0, blue: 186.0/255.0, alpha: 1.0)
            noButton.backgroundColor = UIColor(red: 255.0/255.0, green: 107.0/255.0, blue: 101.0/255.0, alpha: 1.0)
        }
    
    }


    
    
    
    
    
    
    
    
    
    
    
    
   
}
