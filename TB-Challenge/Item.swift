//
//  Item.swift
//  TB-Challenge
//
//  Created by Kaushal Desai on 2019-02-11.
//  Copyright © 2019 Kaushal Desai. All rights reserved.
//

import Foundation
import UIKit


/*** Data for Main tableview ***/
class Item {
    
    var image: UIImage
    var title: String
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}

/* Data for individual items tableview*/
class ItemClicked{
    var image: UIImage
    var title: String
    var price: String
    
    init(image: UIImage, title: String, price: String) {
        self.image = image
        self.title = title
        self.price = price
    }
}
