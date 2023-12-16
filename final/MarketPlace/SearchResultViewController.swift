//
//  SearchResultViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

// manages the search result screen
class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    // searchResults variable is passed from Home view controller
    var searchResults: [Product] = []
    // currentProductID is passed to Product view controller
    var currentProductID = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        cell.myLabel.text = searchResults[indexPath.row].productName
        cell.myImageView.image = searchResults[indexPath.row].productImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentProductID = searchResults[indexPath.row].productID
        performSegue(withIdentifier: "productTableToProductViewSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productTableToProductViewSegue" {
            let destinationViewController = segue.destination as? ProductViewController
            destinationViewController?.currentProductID = currentProductID
        }
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
