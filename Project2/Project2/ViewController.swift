//
//  ViewController.swift
//  Project2
//
//  Created by Sanskar Jethi on 10/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questions=1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countries+=["estonia","france","germany","ireland","italy","monaco", "nigeria","poland", "russia", "spain", "uk", "us" ]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        
        button1.layer.borderColor = UIColor.lightGray.cgColor // since UiColor is above than core graphics layers layer
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }


    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) .Score is \(score)"
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        questions+=1
        
        if(questions==10){
            let bc = UIAlertController(title: "10 Questions have been asked", message: "", preferredStyle: .alert)
            bc.addAction(UIAlertAction(title: "Start Again?", style: .default, handler: { (UIAlertAction) in
                self.score = 0;
                self.askQuestion()
            }))
            
            present(bc, animated: true)
            return
        }
        
        
        var title:String
        
        if(sender.tag==correctAnswer){
            score+=1
            title="Correct"
        }else {
            title="Wrong. Correct answer is \(countries[correctAnswer].uppercased())"
            score-=1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
        
    }
    
}

