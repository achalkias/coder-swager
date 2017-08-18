//
//  CategoriesVC.swift
//  coder-swag
//
//  Created by Apostolos Chalkias on 18/08/2017.
//  Copyright © 2017 Apostolos Chalkias. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
  
    
    @IBOutlet weak var categoryTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            //Get the category path
            let category = DataService.instance.getCategories()[indexPath.row]
            //Update the cell
            cell.updateViews(category: category)
            
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Get the category object
       let category = DataService.instance.getCategories()[indexPath.row]
        //Pass it to segue
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC  {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            assert(sender as? Category != nil)
            productsVC.initProducts(category: sender as! Category)
        }
    }
    
    
    
    
    
    

}

