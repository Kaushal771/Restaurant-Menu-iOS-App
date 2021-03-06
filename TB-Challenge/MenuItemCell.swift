//
//  MenuItemCell.swift
//  TB-Challenge
//
//  Created by Kaushal Desai on 2019-02-11.
//  Copyright © 2019 Kaushal Desai. All rights reserved.
//

/******* This class was to tie the cells of the main table view to the code ******/

import UIKit

class MenuItemCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    func setItem(item: Item) {
        itemImageView.image = item.image
        itemTitleLabel.text = item.title
        
    }
    
}
