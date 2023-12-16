//
//  SellerViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

// manages the seller screen
class SellerViewController: UIViewController {

    var currentProductID: Int = 0
// var currentUserName is passed in from Home view controller and is the user who is logged in
    var currentUserName = ""
    var currentProductIndex = 0
    
    var currentProductImage = UIImage(imageLiteralResourceName: "iphone15.jpg")
    var currentProductName = ""
    var currentPriceString = ""
    var currentProductPrice = 0
    var currentProductDescription = ""
    
    @IBOutlet var sellerError: UILabel!
    @IBOutlet var sellerAddButton: UIButton!
    @IBOutlet var sellerUserName: UILabel!
    @IBOutlet var sellerProductName: UITextField!
    @IBOutlet var sellerPrice: UITextField!
    @IBOutlet var sellerDescription: UITextView!
    @IBOutlet var sellerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sellerUserName.text = currentUserName
        sellerProductName.text = ""
        sellerError.text = ""
        sellerAddButton.layer.cornerRadius = 15
        sellerImage.image = currentProductImage
        // Do any additional setup after loading the view.
    }
    
    @IBAction func productButtonPressed(_ sender: UIButton) {
        
        guard let optionalImage = sellerImage.image else {
            sellerError.text = "Please provide image"
            return
            }
            currentProductImage = optionalImage
        
        guard let optionalProductName = sellerProductName.text else {
            sellerError.text = "Please provide product name"
            return
        }
            currentProductName = optionalProductName
        guard currentProductName != "" else {
            sellerError.text = "Please provide product name"
            return
        }
        
        guard let optionalPriceString = sellerPrice.text else {
            sellerError.text = "Please provide price"
            return
        }
            currentPriceString = optionalPriceString
        guard currentPriceString != "" else {
            sellerError.text = "Please provide price"
            return
        }
        guard let optionalPrice = Int(currentPriceString) else {
            sellerError.text = "Price must be an integer"
            return
        }
            currentProductPrice = optionalPrice
        
        guard let optionalProductDescription = sellerDescription.text else {
            sellerError.text = "Please provide description"
            return
        }
            currentProductDescription = optionalProductDescription
        guard currentProductDescription != "" else {
            sellerError.text = "Please provide description"
            return
        }
        
        if let lastProduct = products.last {
            currentProductID = lastProduct.productID + 1
        }
        let currentProduct = Product(productID: currentProductID, productImage: currentProductImage, productName: currentProductName, productPrice: currentProductPrice, productDescription: currentProductDescription, productUserName: currentUserName)
        products.append(currentProduct)
        sellerProductName.text = "Added!"
        sellerPrice.text = ""
        sellerDescription.text = ""
//        sellerImage.image = nil
        
        currentProductIndex = products.count - 1
//      - decided not to display product screen at this time
//      - would currently give user the ability to buy their own product
//      - need to signal to product to gray out buy and save buttons in version 2
//        performSegue(withIdentifier: "sellerToProductSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sellerToProductSegue" {
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
