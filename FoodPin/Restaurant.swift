//
//  Restaurant.swift
//  FoodPin
//
//  Created by Rizwan Javaid on 10/29/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import Foundation
import CoreData

class Restaurant:NSManagedObject {
    @NSManaged var name:String!
    @NSManaged var type:String!
    @NSManaged var location:String!
    @NSManaged var image:NSData!
    @NSManaged var isVisited:NSNumber!
    
}