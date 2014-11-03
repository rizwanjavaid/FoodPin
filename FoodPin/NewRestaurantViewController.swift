//
//  NewRestaurantViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 11/2/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class NewRestaurantViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        
    }
    
}
