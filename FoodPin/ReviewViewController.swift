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

}
