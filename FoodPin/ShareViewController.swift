//
//  ShareViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 11/1/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var facebookButton:UIButton!
    @IBOutlet weak var messageButton:UIButton!
    @IBOutlet weak var twitterButton:UIButton!
    @IBOutlet weak var emailButton:UIButton!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Hide view
        //        self.twitterButton.transform = CGAffineTransformMakeScale(0, 0)
        //        self.facebookButton.transform = CGAffineTransformMakeScale(0, 0)
        self.facebookButton.transform = CGAffineTransformMakeTranslation(0.0, 570.0)
        self.messageButton.transform = CGAffineTransformMakeTranslation(0.0, 570.0)
        self.twitterButton.transform = CGAffineTransformMakeTranslation(0.0, -498.0)
        self.emailButton.transform = CGAffineTransformMakeTranslation(0.0, -498.0)
        
        // Apply blurring effect
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
       
        // Facebook Button Animation
        UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            
            self.facebookButton.transform = CGAffineTransformMakeTranslation(0, 0.0)
            
            }, completion: nil)
        
        // Message Button Animation
        UIView.animateWithDuration(0.6, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            
            self.messageButton.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
            
            }, completion: nil)
        
        // Twitter Button Animation
        UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
    
            self.twitterButton.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
            
            }, completion: nil)
        
        // Email Button Animation
        UIView.animateWithDuration(0.6, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            
            self.emailButton.transform = CGAffineTransformMakeTranslation(0.0, 0.0)
            
            }, completion: nil)

        
    }

}
