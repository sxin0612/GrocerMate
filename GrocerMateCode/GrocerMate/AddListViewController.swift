//
//  AddListViewController.swift
//  GrocerMate
//
//  Created by Sara Xin on 4/11/23.
//

import UIKit


class AddListViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var backHomeButton: UIButton!
    @IBOutlet var name: UITextField!
    @IBOutlet var location: UITextField!
    
    
    // hide key board when the user touches outside keyboard

        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

        // user presses return key

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            name.resignFirstResponder()
            location.resignFirstResponder()
            return true
        }
    
    override func loadView() {
        super.loadView()
        
        self.name.delegate = self
        self.location.delegate = self
        
        //
        self.view.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        name.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        location.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        
        let cancelImage = UIImage(named: "cancel")
        let cancelResized = cancelImage?.resizedImage(Size:CGSize(width: 75, height: 75))
        backHomeButton.setTitle("", for: .normal)
        backHomeButton.setImage(cancelResized, for: UIControl.State.normal)
        
        let continueImage = UIImage(named: "continue")
        let continueResized = continueImage?.resizedImage(Size:CGSize(width: 75, height: 75))
        continueButton.setTitle("", for: .normal)
        continueButton.setImage(continueResized, for: UIControl.State.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func continueClicked(_ sender: UIButton) {
        print("continue")
        
        let newList = createNewList()
        if (newList != nil) {

            //self.delegate?.didCreate(newList!)
            mainInstanceLists.append(newList!)
            accessIndex = mainInstanceLists.count - 1
            
            
        }
        print(newList!.name)
        print(newList!.location)
        performSegue(withIdentifier: "toEditList", sender: self)
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        print("home clicked")
        performSegue(withIdentifier: "toHome", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHome" {
            if let dest = segue.destination as? ViewController {
               dest.loadView()
               
                
                
                
            }
        }
        
        if segue.identifier == "toEditList" {
            if let dest = segue.destination as? EditListViewController {
               dest.loadView()
               
            }
        }
        
        
        
        
            
    }
    
    func createNewList() -> GroceryList? {
        
        if (name.text != "" && location.text != "") {
            let newList = GroceryList.init(nameInit: name.text!, locationInit: location.text!)
            return newList
        } else {
            return nil
        }
        
    }
    
 
}


