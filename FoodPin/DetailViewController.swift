//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 10/28/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var restaurantImageView:UIImageView!
//    @IBOutlet weak var restaurantNameLabel:UILabel!
//    @IBOutlet weak var restaurantTypeLabel:UILabel!
//    @IBOutlet weak var restaurantLocationLabel:UILabel!
//    @IBOutlet weak var restaurantBeenHereLabel:UILabel!
//    
      var restaurantImage:String!
//    var restaurantName:String!
//    var restaurantType:String!
//    var restaurantLocation:String!
//    var restaurantBeenHere:String!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hue: 360.0/360.0, saturation: 56.0/100.0, brightness: 90.0/100.0, alpha: 1.0)

        // Do any additional setup after loading the view.
        self.restaurantImageView.image = UIImage(named: restaurantImage)
//        self.restaurantNameLabel.text = restaurantName
//        self.restaurantTypeLabel.text = restaurantType
//        self.restaurantLocationLabel.text = restaurantLocation
//        self.restaurantBeenHereLabel.text = restaurantBeenHere
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
