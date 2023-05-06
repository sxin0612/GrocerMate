//
//  AddListViewController.swift
//  GrocerMate
//
//  Created by Sara Xin on 4/11/23.
//

import UIKit
import QuartzCore

class EditListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // user presses return key

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder()
        //location.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mainInstanceLists[accessIndex].items.remove(at: indexPath.row)
            self.grandTotal.text = "Grand Total : $" + String(calclateTotal())
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainInstanceLists[accessIndex].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroceryItemCell") else {
            fatalError("Could not dequeue")
        }
        
        
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = mainInstanceLists[accessIndex].items[indexPath.row].itemName
        }
        else {
            print("No name")
        }
        
        if let price = cell.viewWithTag(2) as? UILabel {
            price.text = "$" + String(mainInstanceLists[accessIndex].items[indexPath.row].unitPrice) + "per unit"
        }
        else {
            print("No Price")
        }
        
        if let quant = cell.viewWithTag(3) as? UILabel {
            quant.text = String(mainInstanceLists[accessIndex].items[indexPath.row].quantity)
        }
        else {
            print("No Price")
        }
        cell.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        return cell
    }
    
    
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var addButton: UIButton!
    
    @IBOutlet var location: UITextField!
    @IBOutlet var name: UITextField!
    
    @IBOutlet var table: UITableView!
    @IBOutlet var grandTotal: UILabel!
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        
        let homeImage = UIImage(named: "home")
        let homeResized = homeImage?.resizedImage(Size:CGSize(width: 75, height: 75))
        homeButton.setTitle("", for: .normal)
        homeButton.setImage(homeResized, for: UIControl.State.normal)
        
        
        let addImage = UIImage(named: "add")
        let addResized = addImage?.resizedImage(Size:CGSize(width: 200, height: 100))
        addButton.setTitle("", for: .normal)
        addButton.setImage(addResized, for: UIControl.State.normal)
        
        table.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        let color = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        self.table.layer.borderColor = color.withAlphaComponent(0.9).cgColor
         self.table.layer.borderWidth = 1;
         self.table.layer.cornerRadius = 10;
        table.delegate = self
        table.dataSource = self
        
        //set up location and name
        self.location.text = mainInstanceLists[accessIndex].location
        self.name.text = mainInstanceLists[accessIndex].name
        self.location.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        self.name.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        
        self.grandTotal.text = "Grand Total : $" + String(calclateTotal())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeClicked(_ sender: UIButton) {
        print("home")
        performSegue(withIdentifier: "editToHome", sender: self)
    }
    
    @IBAction func addClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "editListToSearch", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editToHome" {
            if let dest = segue.destination as? ViewController {
                dest.loadView()
                
                //dest.updateContactDetails(contacts[indexSelected])
                
                
                
            }
        }
        
        if segue.identifier == "editListToSearch" {
            if let dest = segue.destination as? CategorySearchViewController {
                dest.loadView()
                
                //dest.updateContactDetails(contacts[indexSelected])
                
                
                
            }
        }
        
    }
    
    func calclateTotal() -> Double {
        
        var sum = 0.0
        
        for item in mainInstanceLists[accessIndex].items {
        
            sum += item.unitPrice * Double(item.quantity)
        }
                    
        //let roundedValue = round(value * 100) / 100.0
        return round(sum * 100)/100.0
    }
    
}
