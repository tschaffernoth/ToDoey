//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Thomas G Schaffernoth on 11/12/18.
//  Copyright © 2018 Thomas G Schaffernoth. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    var categories: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
 
    }

    // MARK: - Table view data source methods

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.count ?? 1
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let localCategory = categories?[indexPath.row]
        cell.textLabel?.text = localCategory?.title ?? "No Categories added yet"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }

    //MARK:  - Data Manipulation Methods

    func loadCategories() {

        categories = realm.objects(Category.self)
        tableView.reloadData()
    }

    func save(category: Category) {
        
        do {
            
            try realm.write {
                realm.add(category)
            }
            
        } catch {
            print("Error in writing/encoding the data to the file system:  \(error)")
        }
        
        tableView.reloadData()
        
    }

    //MARK:  - Add new categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add a new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            //* When the user presses the buttton to addItem on the Alert
            print("Success: \(String(describing: textField.text))")
            
            let newCategory = Category()
            newCategory.title = textField.text!
            
            self.save(category: newCategory)
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
}


















/*
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
 
 // Configure the cell...
 
 return cell
 }
 */

/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
