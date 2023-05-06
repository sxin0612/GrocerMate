//
//  MyListsModifiedViewController.swift
//  GrocerMate
//
//  Created by Sara Xin on 5/5/23.
//

import Foundation

import UIKit




class MyListsModifiedViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    var myLists = mainInstanceLists
    var indexSelected = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print("SELECTING")
        accessIndex = indexPath.row
        print(accessIndex)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        performSegue(withIdentifier: "modifiedMyListsToEdit", sender: self)
        
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myLists.remove(at: indexPath.row)
            mainInstanceLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyListCell") else {
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
    
    
    @IBOutlet var table: UITableView!
    

    @IBOutlet var backButton: UIButton!
    
    override func loadView() {
        super.loadView()
        
        table.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 0.8)
        table.delegate = self
        table.dataSource = self
        
        let color = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        self.table.layer.borderColor = color.withAlphaComponent(0.9).cgColor
         self.table.layer.borderWidth = 1;
         self.table.layer.cornerRadius = 10;
        
        let backImage = UIImage(named: "back")
        let backResized = backImage?.resizedImage(Size:CGSize(width: 75, height: 75))
        backButton.setTitle("", for: .normal)
        backButton.setImage(backResized, for: UIControl.State.normal)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "modifiedToHome", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "modifiedToHome" {
            if let dest = segue.destination as? ViewController {
               dest.loadView()
               
            }
        }
        
        if segue.identifier == "modifiedMyListsToEdit" {
            if let dest = segue.destination as? EditListViewController {
               dest.loadView()
               
            }
        }
        
        
        
        
    }
}


