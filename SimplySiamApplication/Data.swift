//
//  Data.swift
//  SimplySiamApplication
//
//  Created by student on 1/31/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class MenuItem:Equatable,CustomStringConvertible{
    static func ==(lhs: MenuItem, rhs: MenuItem) -> Bool {
        return true
    }
    
    var description:String{
        return ""
    }
    
    var name:String?
    var itemDescription: String?
    var price: Double?
    var image:UIImage?
    
    init(name:String, itemDescription:String, price:Double, image:UIImage){
        self.name = name
        self.itemDescription = itemDescription
        self.price = price
        self.image = image
    }
}

var item1 = MenuItem(name:"Basil Leaf Noodle", itemDescription:"Choice of meat stir fried with wide rice noodles, fresh chili, fresh garlic, onion, bell pepper, tomato, baby corn and Thai basil", price: 13.0 , image: #imageLiteral(resourceName: "Basil Leaf Noodle"))
var item2 = MenuItem(name:"Cheese Stick", itemDescription:"Made from mild varieties of semi-soft cheese, a cheese stick is a food product that has been formed into a rod-like, individual serving of cheese.", price: 2.15 , image: #imageLiteral(resourceName: "Cheese Stick") )
var item3 = MenuItem(name:"Chicken Pho", itemDescription:"Phở is a flavorful beef broth soup with rice noodles and your choice of meats. Served with a side of fresh bean sprouts, basil leaves, limes, white onions, green onions and jalapeño peppers. ", price: 6.30 , image: #imageLiteral(resourceName: "Chicken Pho") )
var item4 = MenuItem(name:"Crab Rangoon", itemDescription:"Crab Rangoon recipe contains a simple mixture of crab, cream cheese and seasonings wrapped in a wonton wrapper and fried crispy", price: 10 , image: #imageLiteral(resourceName: "Crab Rangoon") )
var item5 = MenuItem(name:"Eggroll Crab", itemDescription:"snack consisting of diced meat or shrimp and shredded vegetables wrapped in a dough made with egg and deep-fried.", price: 20.0 , image: #imageLiteral(resourceName: "Eggroll Crab") )
var item6 = MenuItem(name:"Mango Sticky Rice", itemDescription:"Fresh mango served with steamed sticky rice, sweetened with coconut syrup when in season", price: 20.0 , image: #imageLiteral(resourceName: "Mango Sticky RIce") )
var item7 = MenuItem(name:"Pad Thai", itemDescription:"Rice noodles or bean noodles stir-fried with choice of meat, Thai sauce, egg, bean sprouts, ground peanuts and green onions.", price: 20.0 , image: #imageLiteral(resourceName: "Pad Thai") )
var item8 = MenuItem(name:"Shrimp Salad", itemDescription:"Shrimp or sea food with onion, Asian celery, tomato, peanut, lime juice, fresh Thai chili, fresh garlic, topped with fried garlic, roasted chili, green onions and cilantro", price: 20.0 , image: #imageLiteral(resourceName: "Shrimp Salad") )
var item9 = MenuItem(name:"Xong Pho", itemDescription:"Rice noodle soup in beef broth with choice of meat, bok choy, garlic oil, carrots, green onion, sliced onion, cilantro, ground peanuts, white pepper, chili oil and Thai basil.", price: 20.0 , image: #imageLiteral(resourceName: "Xong Pho") )


struct Menu{
    static var MenuItems:[MenuItem] = [item1,item2,item3,item4,item5,item6,item7,item8,item9]
}

class CartItem{
    var name:String
    var quantity: Double
    var price: Double
    
    init(name: String, quantity:Double, price:Double){
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

var cart1 = CartItem(name: "a", quantity: 1, price: 1)
var cart2 = CartItem(name: "b", quantity: 1, price: 1)
var cart3 = CartItem(name: "c", quantity: 1, price: 1)

var CartItems:[CartItem] = []
