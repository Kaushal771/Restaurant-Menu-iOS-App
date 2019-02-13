//
//  AddItemViewController.swift
//  TB-Challenge
//
//  Created by Kaushal Desai on 2019-02-11.
//  Copyright © 2019 Kaushal Desai. All rights reserved.
//



/**** This Class was for the viewcontroller that would added addtional menu items the main table view of menu items  ********/
import UIKit
import CoreData

class AddItemViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var itemPicture: UIImageView?
   
    @IBOutlet weak var itemName: UITextField!
    
    /* ---- Here I am attempting to change the image type to a binary data type so I can save the Data type and use it later on for core data but I was unsucesfull so I commented it out ----
     
     
     let data = (itemPicture.image?)!.pngData()
     let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
     let image = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: context!)
     
     image.setValue(data, forKey: "img")
     
     do {
     try Constant.context?.save()}
    
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // After saved button is pressed returning to main screen to output new menu item
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
    
    
    // Saving the name of the menu item typed into core data persistent container
    func saveItem(completion: (_ finished: Bool) -> ())
    {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        let item = Task(context: managedContext)
        
        item.itemName = itemName.text
        //item.itemImage = itemPicture.image
        
        
        do {
            try managedContext.save()
            print("data saved")
            completion(true)
        } catch {
            print("failed to save data", error.localizedDescription)
            completion(false)
        }
        
    }
    

}
