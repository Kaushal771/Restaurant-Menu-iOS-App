//
//  MenuListScreen.swift
//  TB-Challenge
//
//  Created by Kaushal Desai on 2019-02-11.
//  Copyright © 2019 Kaushal Desai. All rights reserved.
//

import UIKit
import CoreData

//Global vars and constants
let appDelegate = UIApplication.shared.delegate as? AppDelegate

class MenuListScreen: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // variables
    var items: [Item] = []
    
    var taskArray = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = createArray()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCoreData { (done) in
            if done
            {
                print("data ready to be used")
            }
        }
    }
    
    func createArray() -> [Item]
    {
        
        var tempItems: [Item] = []
        
        let item1 = Item(image: #imageLiteral(resourceName: "pancake"), title: "Pancakes")
        let item2 = Item(image: #imageLiteral(resourceName: "beer"), title: "Drinks")
        let item3 = Item(image: #imageLiteral(resourceName: "omelette"), title: "Omelettes")
        
        tempItems.append(item1)
        tempItems.append(item2)
        tempItems.append(item3)
        
        return tempItems
        
        
        
    }
    
    
    
    
    
    

    
    
}


extension MenuListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! MenuItemCell
        
        cell.setItem(item: item)
        
        return cell
    }
    
   
}

extension MenuListScreen {
    
    func fetchCoreData(completion: (_ complete: Bool) -> ())
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do {
            taskArray = try managedContext.fetch(request) as! [Task]
            print("data fetched")
            completion(true)
        } catch {
            print("Umable to fetch data: ", error.localizedDescription)
            completion(false)
        }
        
    }
    
}
