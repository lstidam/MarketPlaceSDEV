//
//  ProfileViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

//test 123

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var currentUserName = ""
    var currentProductID = 0
    
    var usersProducts: [Product] = []
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.systemMint
        updateUI()

        // Do any additional setup after loading the view.
    }
    func updateUI() {
        let nib = UINib(nibName: "SellingTableViewCell", bundle: nil)
        userNameLabel.text = currentUserName
        tableView.register(nib, forCellReuseIdentifier: "SellingTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        for product in products{
            if product.productUserName == currentUserName{
                usersProducts.append(product)
            }
        }
        

        
    }
    
    
    //TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersProducts.count
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SellingTableViewCell", for: indexPath) as! SellingTableViewCell
        cell.sellingLabel.text = usersProducts[indexPath.row].productName
        cell.sellingImageView.image = usersProducts[indexPath.row].productImage
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentProductID = usersProducts[indexPath.row].productID
        print(currentProductID)
        performSegue(withIdentifier: "profileToProductViewSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileToProductViewSegue" {
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
