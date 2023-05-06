//
//  GrocerMateFramework.swift
//  GrocerMate
//
//  Created by Sara Xin on 4/24/23.
//

import Foundation

public var myLists : [GroceryList] = []

public func addList(_ groceryList: GroceryList){
    myLists.append(groceryList)
    print(myLists)
}

