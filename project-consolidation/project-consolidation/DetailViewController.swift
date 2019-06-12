//
//  DetailViewController.swift
//  project-consolidation
//
//  Created by Sanskar Jethi on 13/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedImage: String?
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageUrl = selectedImage {
            imageView.image = UIImage(named: imageUrl)
            title = selectedImage
        }
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
