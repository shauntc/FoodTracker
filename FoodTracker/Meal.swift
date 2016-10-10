//
//  Meal.swift
//  FoodTracker
//
//  Created by Shaun Campbell on 2016-10-10.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class Meal: NSObject {

    //MARK: Properties
    
    var name:String
    var photo:UIImage?
    var rating:Int
    
    //MARK: Initialization
    
    init?(name:String, photo:UIImage?, rating:Int){
        
        guard name.isEmpty || rating < 0 else {
            return nil;
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
