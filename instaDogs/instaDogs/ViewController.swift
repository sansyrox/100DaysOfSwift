//
//  ViewController.swift
//  instaDogs
//
//  Created by Sanskar Jethi on 03/07/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.title = "InstaDogs"

    }

    @IBAction func loginClickButton(_ sender: Any) {
        
        print("Login Button Clicked")
        
        if(usernameTextField.text != "" && passwordTextField.text != ""){
            Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
                print("user is authenticated")
                
                if(user != nil){
                    print("user is authenticated")
                    // let vc to next view controller and to dismiss we say self.presentingViewCOntroller?.dismiss
                }
                else {
                    print(" not authenticated")
                }
            }
        }
        else {
            print("there was an error")
        }
    }
    
    
}

