//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Thomas G Schaffernoth on 11/7/18.
//  Copyright © 2018 Thomas G Schaffernoth. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["1st Item to do", "2nd Item to do", "3rd Item to do"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: - Tableview Delegate Methods
    
    //**************************************************************
    //* Tells the delegate that the specified row is now selected. *
    //**************************************************************
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])

        if ( tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //**********************************************************
    //* Asks the delegate for the height to use for a row in a *
    //* specified location.                                    *
    //**********************************************************
    override func tableView(_ tableView: UITableView, heightForRowAt: IndexPath) -> CGFloat {
    
        return 50.0
    }
    
    //************************************************************
    //* Asks the delegate for the estimated height of a row in a *
    //* specified location.                                      *
    //************************************************************
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt: IndexPath) -> CGFloat {
    
        return 50.0
    }
    
    //******************************************************************
    //* Asks the delegate to return the level of indentation for a row *
    //* in a given section.                                            *
    //******************************************************************
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt: IndexPath) -> Int {
    
        return 1
    }
    
    //*************************************************************
    //* Tells the delegate the table view is about to draw a cell *
    //* for a particular row.                                     *
    //*************************************************************
    override func tableView(_ tableView: UITableView, willDisplay: UITableViewCell, forRowAt: IndexPath) {
        
    }
    
    //**************************************************************
    //* Called to let you fine tune the spring-loading behavior of *
    //* the rows in a table.                                       *
    //**************************************************************
    override func tableView(_ tableView: UITableView, shouldSpringLoadRowAt: IndexPath, with: UISpringLoadedInteractionContext) -> Bool {
        
        return false
    }
    

}

