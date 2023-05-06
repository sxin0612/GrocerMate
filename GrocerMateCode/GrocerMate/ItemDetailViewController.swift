//
//  ItemDetailViewController.swift
//  GrocerMate
//
//  Created by Sara Xin on 5/3/23.
//

import Foundation
import UIKit

class ItemDetailViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // user presses return key

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder()
        //location.resignFirstResponder()
        return true
    }
    
   

    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!

    
    @IBOutlet weak var enterQuantity: UITextField!
    
    func updateLabels(_ nameLabel: String, _ priceLabel: String, _ quantityLabel: String) {
        self.name.text = nameLabel
        self.price.text = "Unit Price: $" + priceLabel
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
       
        super.loadView()
        print("in DETAIL VIEW")
        print(selectedItem)
        self.name.text = selectedItem.itemName
        self.price.text = "Unit Price: $" +  String(selectedItem.unitPrice)
       
        
        self.view.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        
        enterQuantity.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        
        
        let backImage = UIImage(named: "back")
        let backResized = backImage?.resizedImage(Size:CGSize(width: 75, height: 75))
        backButton.setTitle("", for: .normal)
        backButton.setImage(backResized, for: UIControl.State.normal)
        
        
        let addImage = UIImage(named: "addConfirmed")
        let addResized = addImage?.resizedImage(Size:CGSize(width: 100, height: 75))
        addButton.setTitle("", for: .normal)
        addButton.setImage(addResized, for: UIControl.State.normal)
       
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "detailToSearch", sender: self)
    }
    
    @IBAction func addClicked(_ sender: UIButton) {
        let newItem = GroceryItem(itemName: selectedItem.itemName, unitPrice: selectedItem.unitPrice, quantity: Int(enterQuantity.text!)!)
        mainInstanceLists[accessIndex].items.append(newItem)
        
        //performSegue(withIdentifier: "detailToSearch", sender: self)
        
        performSegue(withIdentifier: "detailToEdit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailToEdit" {
            if let dest = segue.destination as? EditListViewController {
               dest.loadView()
               
            }
        }
        
        
        
    }
    
}
