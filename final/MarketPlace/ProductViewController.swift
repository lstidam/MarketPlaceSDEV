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
    
    var currentProductIndex: Int = 0
    var currentUserName: String = ""
    var currentProductID: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyButton.layer.cornerRadius = 15
        saveButton.layer.cornerRadius = 15
        userNameButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        let currentProduct = products[currentProductIndex]
        currentProductID = currentProduct.productID
        productImageImage.image = currentProduct.productImage
        productNameLabel.text = currentProduct.productName
        productPriceLabel.text = "$" + String(currentProduct.productPrice)
        productDescriptionLabel.text = currentProduct.productDescription
        userNameButton.setTitle(currentProduct.productUserName, for: .normal)
        
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
        products.remove(at: currentProductIndex)
        productDescriptionLabel.text = "Thank you for your purchase."
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let currentSavedProduct = SavedProduct(savedUserName: currentUserName, savedProductID: currentProductID)
        savedProducts.append(currentSavedProduct)
        products.remove(at: currentProductIndex)
        productDescriptionLabel.text = "Saved."
    }
    
    
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "productToProfileSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productToProfileSegue" {
            let destinationViewController = segue.destination as? ProfileViewController
            destinationViewController?.currentUserName = currentUserName
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
