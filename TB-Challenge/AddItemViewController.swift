//
//  AddItemViewController.swift
//  TB-Challenge
//
//  Created by Kaushal Desai on 2019-02-11.
//  Copyright © 2019 Kaushal Desai. All rights reserved.
//

import UIKit
import CoreData

class AddItemViewController: UIViewController {
    
    
    //@IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButtonPressed(_ sender: Any)
    {
        saveItem { (done) in
            if done
            {
                print("need to return")
                navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                print("try aagin")
            }
        }
    }
    
    func saveItem(completion: (_ finished: Bool) -> ())
    {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        let item = Task(context: managedContext)
        
        item.itemName = itemName.text
        
        do {
            try managedContext.save()
            print("data saved")
            completion(true)
        } catch {
            print("failed to dave", error.localizedDescription)
            completion(false)
        }
        
    }
    

}
