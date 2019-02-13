//
//  MenuItemClickedTableViewController.swift
//  TB-Challenge
//
//  Created by Kaushal Desai on 2019-02-12.
//  Copyright © 2019 Kaushal Desai. All rights reserved.
//

import UIKit

class MenuItemClickedTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemsClicked: [ItemClicked] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsClicked = createArray()
        tableView.delegate = self
        tableView.dataSource = self

       
    }
    
    func createArray() -> [ItemClicked]
    {
       var tempItemClicked: [ItemClicked] = []
        
        let itemClicked1 = ItemClicked(image: #imageLiteral(resourceName: "pancake"), title: "Blueberry Pancake", price: "$15.99")
        let itemClicked2 = ItemClicked(image: #imageLiteral(resourceName: "chocochip"), title: "ChocoChip Pancake", price: "$15.99")
        let itemClicked3 = ItemClicked(image: #imageLiteral(resourceName: "foutaindrink"), title: "Fountain Drinks", price: "$5.00")
        let itemClicked4 = ItemClicked(image: #imageLiteral(resourceName: "alcoholic"), title: "Alcoholic Drinks", price: "$10.00")
        let itemClicked5 = ItemClicked(image: #imageLiteral(resourceName: "hamandcheese"), title: "Ham & Cheese Omelette", price: "$12.00")
        let itemClicked6 = ItemClicked(image: #imageLiteral(resourceName: "spinach"), title: "Spinach Omelette", price: "$12.00")
        
        tempItemClicked.append(itemClicked1)
        tempItemClicked.append(itemClicked2)
        tempItemClicked.append(itemClicked3)
        tempItemClicked.append(itemClicked4)
        tempItemClicked.append(itemClicked5)
        tempItemClicked.append(itemClicked6)
        
        return tempItemClicked
        
    }



}

extension MenuItemClickedTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsClicked.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemClicked = itemsClicked[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemClickedTableViewCell") as! MenuItemClickedTableViewCell
        
        cell.setItemClicked(itemClicked: itemClicked)
        
        return cell
    }
    
}
