//
//  MyListsViewController.swift
//  GrocerMate
//
//  Created by Sara Xin on 4/19/23.
//

import Foundation
import UIKit



class MyListsViewController: UITableViewController {
    
    @IBOutlet var backButton: UIBarButtonItem!
    
    @IBOutlet var topBar: UINavigationItem!
    @IBOutlet var bar: UINavigationBar!
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "myListsToHome", sender: self)
    }
    
    var myLists = mainInstanceLists
    
    func addMyLists(_ theList: [GroceryList]) {
        myLists.append(contentsOf: theList)
        tableView.reloadData()
    }
    
    
    var indexSelected = -1
    
    override func loadView() {
        super.loadView()
        
        //self.setTit
        
      
        self.view.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        topBar.titleView?.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        bar.barTintColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Lists"
        
    }
    
    func didCreate(_ groceryList: GroceryList) {
       // print("did create a contact! and add it")
       
        //dismiss(animated: true, completion: nil)
        myLists.append(groceryList)
        print("DID I CREATE")
        
        tableView.reloadData()
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroceryListCell") else {
            fatalError("Could not dequeue")
        }
        
        
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = myLists[indexPath.row].name
        }
        else {
            print("No name")
        }
        
        if let location = cell.viewWithTag(2) as? UILabel {
            location.text = myLists[indexPath.row].location
        }
        else {
            print("No location")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "myListsToHome" {
            if let dest = segue.destination as? ViewController {
               dest.loadView()
               
            }
        }
        
        if segue.identifier == "myListsToEdit" {
            if let dest = segue.destination as? EditListViewController {
               dest.loadView()
               
            }
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //mainInstanceLists.remove(at: <#T##Int#>)
            mainInstanceLists.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print("SELECTING")
        accessIndex = indexPath.row
        print(accessIndex)
        tableView.deselectRow(at: indexPath, animated: true)
        
        //selectedName = filteredData[indexPath.row].itemName
        //selectedPrice = String(filteredData[indexPath.row].unitPrice)
        //selectedQuantity = String(filteredData[indexPath.row].quantity)
        
        
        performSegue(withIdentifier: "myListsToEdit", sender: self)
        
        
        tableView.reloadData()
    }
}
