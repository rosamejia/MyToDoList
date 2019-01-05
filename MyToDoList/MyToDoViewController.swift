//
//  ViewController.swift
//  MyToDoList
//
//  Created by Rosa Mejia on 1/4/19.
//  Copyright © 2019 Rosa Mejia. All rights reserved.
//

import UIKit

class MyToDoViewController: UITableViewController {

    let itemArray = ["Item 1", "Item 2", "Item 3"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK table view source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        print(itemArray[indexPath.row])
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("did load")
    }

    //MARK table view delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("selected row" + itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
    


