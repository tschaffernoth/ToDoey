//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Thomas G Schaffernoth on 11/12/18.
//  Copyright © 2018 Thomas G Schaffernoth. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categoryArray = [Category]()

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
        return categoryArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let localCategory = categoryArray[indexPath.row]
        cell.textLabel?.text = localCategory.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }

    //MARK:  - Data Manipulation Methods
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest() ) {
        do {
            categoryArray =  try context.fetch(request)
        } catch {
            print("Error loading categories from SQLite DB: \(error) ")
        }
        print("Array of Categories = \(categoryArray)")
        tableView.reloadData()
    }
    func saveCategories() {
        
        do {
            
            try context.save()
            
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
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categoryArray.append(newCategory)
            
            self.saveCategories()
            
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
