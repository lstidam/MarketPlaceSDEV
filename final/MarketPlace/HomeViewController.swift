//
//  HomeViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var featuredImage: UIImageView!
    @IBOutlet var featuredProductName: UILabel!
    @IBOutlet var sellerButton: UIButton!
    @IBOutlet var searchResultButton: UIButton!
    @IBOutlet var profileButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    
    var currentProductName = ""
    var currentUserName = ""
    var currentProductID = 0
    var searchResults: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sellerButton.layer.cornerRadius = 15
        searchResultButton.layer.cornerRadius = 15
        profileButton.layer.cornerRadius = 15
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        let productsCount = products.count
        let randomIndex = Int.random(in: 0...productsCount - 1)
        let featuredProduct = products[randomIndex]
        featuredImage.image = featuredProduct.productImage
        featuredProductName.text = featuredProduct.productName
        currentProductID = featuredProduct.productID
    }
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "homeToProductSegue", sender: self)
    }
    
    @IBAction func sellerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToSellerSegue", sender: self)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchResults = []
        guard let searchText = searchTextField.text else { return}
        guard searchText != "" else {
            searchTextField.text = "Please enter search text"
            return
        }
        for searchProduct in products {
            if searchProduct.productName.lowercased().contains(searchText.lowercased()) {
                searchResults.append(searchProduct)
            } else if searchProduct.productDescription.lowercased().contains(searchText.lowercased()) {
                searchResults.append(searchProduct)
            }
        }
        print(searchResults)
        performSegue(withIdentifier: "homeToSearchResultSegue", sender: self)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToProfileSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToSellerSegue" {
            let destinationViewController = segue.destination as? SellerViewController
            destinationViewController?.currentUserName = loggedInUserName
        }
        if segue.identifier == "homeToSearchResultSegue" {
            let destinationViewController = segue.destination as? SearchResultViewController
            destinationViewController?.searchResults = searchResults
        }
    
        if segue.identifier == "homeToProductSegue" {
            let destinationViewController = segue.destination as? ProductViewController
            destinationViewController?.currentProductID = currentProductID
        }
        if segue.identifier == "homeToProfileSegue" {
            let destinationViewController = segue.destination as? ProfileViewController
            destinationViewController?.currentUserName = loggedInUserName
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
