//
//  DetailViewController.swift
//  Project1-HW
//
//  Created by Sanskar Jethi on 08/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var URL:String?
    @IBOutlet var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = URL
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = URL {
            imageView.image = UIImage(named: imageToLoad)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
