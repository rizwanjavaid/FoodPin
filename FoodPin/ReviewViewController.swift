//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 11/1/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var dialogView:UIView!
    @IBOutlet weak var goodReviewButton: UIButton!
    @IBOutlet weak var badReviewButton: UIButton!
    @IBOutlet weak var greatReviewButton: UIButton!
    var restaurant:Restaurant!
    var review:String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Apply blurring effect
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Hide view
        dialogView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        let scale = CGAffineTransformMakeScale(0.0,0.0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        
        // Slide Up Animation
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Spring Animation
        UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
        
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
            
            }, completion: nil)
        
    }
    
    @IBAction func reviewButtonSelected(sender: UIButton) {
        
        let buttonClicked = sender as UIButton
        
        // When Bad Review button is clicked
        if buttonClicked == badReviewButton {
           review = "Bad"
            badReviewButton.backgroundColor = UIColor(red: 255.0/255.0, green: 5.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            goodReviewButton.backgroundColor = UIColor.grayColor()
            greatReviewButton.backgroundColor = UIColor.grayColor()
            
            // Execute the unwind segue once the values have been extracted
            performSegueWithIdentifier("unwindToViewController", sender: self)
            
            println("Bad Review Button Clicked")

        
       
        } else if buttonClicked == goodReviewButton {
           
            // When Good Review button is clicked
            review = "Good"
            goodReviewButton.backgroundColor = UIColor(red: 255.0/255.0, green: 128.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            badReviewButton.backgroundColor = UIColor.grayColor()
            greatReviewButton.backgroundColor = UIColor.grayColor()
            
            // Execute the unwind segue once the values have been extracted
            performSegueWithIdentifier("unwindToViewController", sender: self)
            
            println("Good Review Button Clicked")
            
            
        } else if buttonClicked == greatReviewButton {
          
            // When Great Review button is clicked
            review = "Great"
            greatReviewButton.backgroundColor = UIColor(red: 17.0/255.0, green: 197.0/255.0, blue: 2.0/255.0, alpha: 1.0)
            badReviewButton.backgroundColor = UIColor.grayColor()
            goodReviewButton.backgroundColor = UIColor.grayColor()
            
            // Execute the unwind segue once the values have been extracted
            performSegueWithIdentifier("unwindToViewController", sender: self)
            
            println("Great Review Button Clicked")

            
        }
        
    }
    

}
