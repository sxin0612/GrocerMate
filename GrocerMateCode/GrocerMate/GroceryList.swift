//
//  GroceryList.swift
//  GrocerMate
//
//  Created by Sara Xin on 4/19/23.
//

import Foundation
import UIKit

public struct GroceryItem {
    let itemName: String
    let unitPrice: Double
    let quantity: Int
    
    init(itemName: String, unitPrice: Double, quantity: Int) {
        self.itemName = itemName
        self.unitPrice = unitPrice
        self.quantity = quantity
    }
}

public struct GroceryList {
    
    let name: String
    let location: String
    let grandTotal: Double
    var items: [GroceryItem]
    //each item should have name, unit price, quantity
    
    init(nameInit: String, locationInit: String) {
        self.name = nameInit
        self.location = locationInit
        self.grandTotal = 0.0
        items = []
    }
}

var mainInstance = GroceryList(nameInit: "testName", locationInit: "testLocation")

var mainInstanceLists = [GroceryList]()

var accessIndex = 0 //set to the index of the array where we want to display 


//set up all items here
var honeyCrispApple = GroceryItem(itemName: "Honey Crisp Apple", unitPrice: 1.99, quantity: 1)
var fijiApple = GroceryItem(itemName: "Fuji Apple", unitPrice: 1.39, quantity: 1)
var grannySmithApple = GroceryItem(itemName: "Granny Smith Apple", unitPrice: 1.50, quantity: 1)
var redDeliciousApple = GroceryItem(itemName: "Red Delicious Apple", unitPrice: 1.99, quantity: 1)

var pear = GroceryItem(itemName: "Asian Pear", unitPrice: 5.99, quantity: 1)
var brocolli = GroceryItem(itemName: "Brocolli", unitPrice: 1.40, quantity: 1)
var kale = GroceryItem(itemName: "Kale", unitPrice: 3.40, quantity: 1)

var fruitsAndVeg = [honeyCrispApple, fijiApple, grannySmithApple, redDeliciousApple, pear, brocolli, kale]

var paperTowel = GroceryItem(itemName: "Paper Towels", unitPrice: 3.00, quantity: 1)
var paperPlates = GroceryItem(itemName: "Paper Plates", unitPrice: 4.66, quantity: 1)
var tissues = GroceryItem(itemName: "Tissues", unitPrice: 2.50, quantity: 1)
var napkins = GroceryItem(itemName: "Napkins", unitPrice: 3.00, quantity: 1)

var paperGoods = [paperTowel, paperPlates, tissues, napkins]

var oatmilk = GroceryItem(itemName: "Oat Milk", unitPrice: 5.78, quantity: 1)
var wholeMilk = GroceryItem(itemName: "Whole Milk", unitPrice: 3.58, quantity: 1)
var almondMilk = GroceryItem(itemName: "Almond Milk", unitPrice: 4.99, quantity: 1)
var cheddarCheese = GroceryItem(itemName: "Cheddar Cheese", unitPrice: 3.99, quantity: 1)
var goudaCheese = GroceryItem(itemName: "Gouda Cheese", unitPrice: 6.99, quantity: 1)
var butter = GroceryItem(itemName: "Butter", unitPrice: 3.99, quantity: 1)
var eggs = GroceryItem(itemName: "Eggs", unitPrice: 6.78, quantity: 1)

var dairyAndEggs = [oatmilk, wholeMilk, almondMilk, cheddarCheese, goudaCheese, butter, eggs]


var allItems = fruitsAndVeg + paperGoods

//TODO: Add other categories later

var selectedItem = paperTowel
