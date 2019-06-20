//
//  ViewController.swift
//  no-storyboard
//
//  Created by Sanskar Jethi on 20/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // let's avoid polluting view did load
    
    let bearImageView:UIImageView = {
        let image = UIImage(named: "bear_foot.png")
        let imageView = UIImageView(image: image)
        // this enable autolayour for our code
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
//        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games", attributes: [NSAttributedStringKet.font : UIFont.boldSystemFont(ofSize: 18)])
        
        textView.attributedText = attributedText
        
        textView.text = "Join us today in our fun and games!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false 
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
        
        
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
//        topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
//        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
//        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        topImageContainerView.addSubview(bearImageView)
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
//        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5 ).isActive = true
        
        descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }


}

