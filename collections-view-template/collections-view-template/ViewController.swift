//
//  ViewController.swift
//  collections-view-template
//
//  Created by Sanskar Jethi on 22/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class CustomCollectionViewController: UICollectionViewController {

    let customCellIdentifier = "customCellClass"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // collection View has a red View Controller
        collectionView?.backgroundColor = UIColor.red
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: <#T##String#>)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }


}

