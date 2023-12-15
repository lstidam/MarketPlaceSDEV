//
//  ProductViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet var productImageImage: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var productDescriptionLabel: UILabel!
    @IBOutlet var buyButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var userNameButton: UIButton!
    
    var currentProductID: Int = 0
    var sellerUserName: String = ""
    var currentProductIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("pr \(currentProductID)")
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    // find product in products array associated with passed in currentProductID
    func updateUI() {
        buyButton.layer.cornerRadius = 15
        saveButton.layer.cornerRadius = 15
        userNameButton.layer.cornerRadius = 15
        userNameButton.isEnabled = true
        var displayProductFound = false
        for displayProduct in products {
            if displayProduct.productID == currentProductID {
                displayProductFound = true
                productImageImage.image = displayProduct.productImage
                productNameLabel.text = displayProduct.productName
                productPriceLabel.text = "$" + String(displayProduct.productPrice)
                productDescriptionLabel.text = displayProduct.productDescription
                userNameButton.setTitle(displayProduct.productUserName, for: .normal)
                sellerUserName = displayProduct.productUserName
                break
            }
        }
        // product not found in products array
        if displayProductFound == false {
            productDescriptionLabel.text = "Product not found"
            userNameButton.isEnabled = false
        }
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
        products.remove(at: currentProductIndex)
        productDescriptionLabel.text = "Thank you for your purchase."
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let currentSavedProduct = SavedProduct(savedUserName: loggedInUserName, savedProductID: currentProductID)
        savedProducts.append(currentSavedProduct)
        productDescriptionLabel.text = "Saved."
    }
    
    
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "productToProfileSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productToProfileSegue" {
            let destinationViewController = segue.destination as? ProfileViewController
            destinationViewController?.currentUserName = sellerUserName
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
