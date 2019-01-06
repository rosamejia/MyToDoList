//
//  ViewController.swift
//  MyToDoList
//
//  Created by Rosa Mejia on 1/4/19.
//  Copyright © 2019 Rosa Mejia. All rights reserved.
//

import UIKit

class MyToDoViewController: UITableViewController {

    var itemArray = [Item]()
    var defaults = UserDefaults.standard
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK table view source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
//      or cell.accessoryType = item.done == true ? .checkmark : .none
//      or
//        if item.done == true{
//            cell.accessoryType = .checkmark
//        }
//        else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print("did load")
//        if let items = defaults.array(forKey: "MyToDoListArray") as? [String]{
//            itemArray = items
//        }
        let newItem = Item()
        newItem.title = "Item 1"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Item 2"
        itemArray.append(newItem2)
        
        if let items = defaults.array(forKey: "MyToDoListArray") as? [Item]{
            itemArray = items
        }
    }

    //MARK table view delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("selected row" + itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item?", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "MyToDoListArray") 
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
    


