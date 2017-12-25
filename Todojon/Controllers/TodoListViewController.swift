//
//  ViewController.swift
//  Todojon
//
//  Created by JON SKYNET on 16/12/2017.
//  Copyright © 2017 JON SKYNET. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Find Touristologists"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Web-Egineers"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Investors"
        itemArray.append(newItem3)
        
        
        // To prevent crash the app if TodoListArray is empty...
        //itemArray = defaults.array(forKey: "TodoListArray") as! [String]
        // Use optionals
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }
    }
    // Mark - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        //cell.textLabel?.text = itemArray[indexPath.row].title
        cell.textLabel?.text = item.title
        
        //Using Ternary Operator
        cell.accessoryType = item.done ? .checkmark : .none
        /*if item.done == true {
        //if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        } */
        return cell
    }
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print (itemArray[indexPath.row])
       itemArray[indexPath.row].done = !itemArray[indexPath.row].done
     /*   if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        } else {
            itemArray[indexPath.row].done = false
        } */
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todojon Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            //print("Success!")
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            // self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            //print("alertTextField.text")
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

}

