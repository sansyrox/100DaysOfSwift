//
//  ViewController.swift
//  project-consolidation
//
//  Created by Sanskar Jethi on 13/06/19.
//  Copyright © 2019 Sanskar Jethi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var items=[String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath
        let item = try! fm.contentsOfDirectory(atPath: path!)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flag Viewer"
        
        for i in item {
            if(i.hasSuffix("@3x.png")){
                items.append(i)
            }
        }
        items.sort()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "\(items[indexPath.row])"
        cell.imageView?.image = UIImage(named: items[indexPath.row])
        
        return cell;
        
    }
//
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = items[indexPath.row]
            
            let name = items[indexPath.row]
            
            vc.title = name.uppercased()
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

