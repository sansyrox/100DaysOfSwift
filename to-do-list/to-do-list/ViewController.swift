//
//  ViewController.swift
//  to-do-list
//
//  Created by Sanskar Jethi on 19/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var toDo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createLog))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(removeAnswers))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        cell.textLabel?.text = toDo[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        toDo.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    @objc func createLog(){
        let ac = UIAlertController(title: "To Do", message: "Enter the ToDo item", preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.submitAnswer(answer)
            print(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }

    
    func submitAnswer(_ answer: String){
        toDo.insert(answer, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        print("Click kiya")
    }
    
    @objc func removeAnswers(){
        toDo.removeAll()
//        toDo.remove(at: 0)
//        let indexPath = IndexPath(row: toDo.count-1, section: 0)
//        toDo.remove(at: toDo.count - 1)
//        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.reloadData()
    }
}

