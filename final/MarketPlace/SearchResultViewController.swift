//
//  SearchResultViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var currentProductName = ""
    var searchResults: [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sr \(searchResults)")
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return products.count
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
//        cell.myLabel.text = products[indexPath.row].productName
        cell.myLabel.text = searchResults[indexPath.row].productName
//        cell.myImageView.image = products[indexPath.row].productImage
        cell.myImageView.image = searchResults[indexPath.row].productImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let currentProductID = products[indexPath.row].productID
        let currentProductID = searchResults[indexPath.row].productID
        print(currentProductID)
        performSegue(withIdentifier: "productTableToProductViewSegue", sender: self)
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
