//
//  MealTableViewCell.swift
//  food_tracker
//
//  Created by Sanskar Jethi on 27/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet var nameLable: UILabel!
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var ratingController: RatingController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
