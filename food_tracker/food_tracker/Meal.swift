//
//  File.swift
//  food_tracker
//
//  Created by Sanskar Jethi on 27/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage, rating: Int) {
        if(name.isEmpty || rating<0){
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}
