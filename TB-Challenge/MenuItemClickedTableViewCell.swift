//
//  MenuItemClickedTableViewCell.swift
//  TB-Challenge
//
//  Created by Kaushal Desai on 2019-02-12.
//  Copyright © 2019 Kaushal Desai. All rights reserved.
//

import UIKit

class MenuItemClickedTableViewCell: UITableViewCell {

    @IBOutlet weak var menuItemImage: UIImageView!
    @IBOutlet weak var menuItemName: UILabel!
    @IBOutlet weak var menuItemPrice: UILabel!
    
    

    func setItemClicked(itemClicked: ItemClicked) {
        
        menuItemImage.image = itemClicked.image
        menuItemName.text = itemClicked.title
        menuItemPrice.text = itemClicked.price
    
    
    
    }

}
