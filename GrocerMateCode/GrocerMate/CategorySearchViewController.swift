//
//  CategorySearchViewController.swift
//  GrocerMate
//
//  Created by Sara Xin on 5/3/23.
//

import UIKit
import Foundation

import QuartzCore

class CategorySearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var filteredData: [GroceryItem]!
    
    var selectedName = ""
    var selectedPrice = ""
    var selectedQuantity = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "allItemCell") else {
            fatalError("Could not dequeue")
        }
        
        
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = filteredData[indexPath.row].itemName
        }
        else {
            print("No name")
        }
        
        if let price = cell.viewWithTag(2) as? UILabel {
            price.text = "$" + String(filteredData[indexPath.row].unitPrice)
        }
        else {
            print("No Price")
        }
        
        
        cell.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        
        if cell.isSelected {
            
          }
        
        return cell
    }
    
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var fruitAndVegButton: UIButton!
    @IBOutlet weak var paperGoodsButton: UIButton!
    @IBOutlet weak var DairyEggsButton: UIButton!
    @IBOutlet weak var SnacksButton: UIButton!
    @IBOutlet weak var MeatSeafoodButton: UIButton!
    @IBOutlet weak var BreadButton: UIButton!
    
    override func loadView() {
        super.loadView()
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.delegate = self
        //let color = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        let color = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        self.tableView.layer.borderColor = color.withAlphaComponent(0.9).cgColor
         self.tableView.layer.borderWidth = 1;
         self.tableView.layer.cornerRadius = 10;
        
        self.searchBar.layer.borderColor = color.withAlphaComponent(0.9).cgColor
        self.searchBar.layer.borderWidth = 10;
        self.searchBar.layer.cornerRadius = 5;
        //searchBar.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 220/255.0, alpha: 1)
        tableView.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        self.view.backgroundColor = UIColor(red: 180/255.0, green: 204/255.0, blue: 155/255.0, alpha: 1)
        //tableView.delgate = self
        filteredData = allItems
        
        
        
        
        
        let backImage = UIImage(named: "back")
        let backResized = backImage?.resizedImage(Size:CGSize(width: 75, height: 75))
        backButton.setTitle("", for: .normal)
        backButton.setImage(backResized, for: UIControl.State.normal)
        
        
        //all other buttons
        let fruitImage = UIImage(named: "fruitAndVeg")
        let fruitResized = fruitImage?.resizedImage(Size:CGSize(width: 100, height: 100))
        fruitAndVegButton.setTitle("", for: .normal)
        fruitAndVegButton.setImage(fruitResized, for: UIControl.State.normal)
        
        let paperImage = UIImage(named: "paperGoods")
        let paperResized = paperImage?.resizedImage(Size:CGSize(width: 100, height: 100))
        paperGoodsButton.setTitle("", for: .normal)
        paperGoodsButton.setImage(paperResized, for: UIControl.State.normal)
        
        let dairyImage = UIImage(named: "dairyandEggs")
        let dairyResized = dairyImage?.resizedImage(Size:CGSize(width: 100, height: 100))
        DairyEggsButton.setTitle("", for: .normal)
        DairyEggsButton.setImage(dairyResized, for: UIControl.State.normal)
        
        let snacksImage = UIImage(named: "snacks")
        let snacksResized = snacksImage?.resizedImage(Size:CGSize(width: 100, height: 100))
        SnacksButton.setTitle("", for: .normal)
        SnacksButton.setImage(snacksResized, for: UIControl.State.normal)
        
        
        let meatImage = UIImage(named: "meatandsea")
        let meatResized = meatImage?.resizedImage(Size:CGSize(width: 100, height: 100))
        MeatSeafoodButton.setTitle("", for: .normal)
        MeatSeafoodButton.setImage(meatResized, for: UIControl.State.normal)
        
        
        let breadImage = UIImage(named: "bread")
        let breadResized = breadImage?.resizedImage(Size:CGSize(width: 100, height: 100))
        BreadButton.setTitle("", for: .normal)
        BreadButton.setImage(breadResized, for: UIControl.State.normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "searchToEdit", sender: self)
    }
    
    var indexSelected = 0
    
    
    
    //searchToEdit
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchToEdit" {
            if let dest = segue.destination as? EditListViewController {
                
                dest.loadView()
                
                
            }
        }
        
        if segue.identifier == "toDetail" {
            if let dest = segue.destination as? ItemDetailViewController {
                
                dest.loadView()
                
                
            }
        }
        
        
        
      
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
        filteredData = searchText.isEmpty ? allItems : allItems.filter { (item: GroceryItem) -> Bool in
                // If dataItem matches the searchText, return true to include it
            return item.itemName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            
            tableView.reloadData()
        }
        
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print("SELECTING")
        selectedItem = filteredData[indexPath.row]
        print(selectedItem)
        tableView.deselectRow(at: indexPath, animated: true)
        
        //selectedName = filteredData[indexPath.row].itemName
        //selectedPrice = String(filteredData[indexPath.row].unitPrice)
        //selectedQuantity = String(filteredData[indexPath.row].quantity)
        
        
        performSegue(withIdentifier: "toDetail", sender: self)
        
        
        tableView.reloadData()
    }
    
    
        
}
