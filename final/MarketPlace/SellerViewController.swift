//
//  SellerViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

class SellerViewController: UIViewController {

    var currentUserName = ""
    var currentProductIndex = 0
    
    var currentProductID = 0
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
            sellerError.text = "User did not provide image"
            return
            }
            currentProductImage = optionalImage
        
        guard let optionalProductName = sellerProductName.text else {
            sellerError.text = "User did not provide product name"
            return
        }
            currentProductName = optionalProductName
        guard currentProductName != "" else {
            sellerError.text = "User did not provide product name"
            return
        }
        
        guard let optionalPriceString = sellerPrice.text else {
            sellerError.text = "User did not enter price"
            return
        }
            currentPriceString = optionalPriceString
        guard currentPriceString != "" else {
            sellerError.text = "User did not enter price"
            return
        }
        guard let optionalPrice = Int(currentPriceString) else {
            sellerError.text = "User entered non-integer price"
            return
        }
            currentProductPrice = optionalPrice
        
        guard let optionalProductDescription = sellerDescription.text else {
            sellerError.text = "User did not provide description"
            return
        }
            currentProductDescription = optionalProductDescription
        guard currentProductDescription != "" else {
            sellerError.text = "User did not provide description"
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
        performSegue(withIdentifier: "sellerToProductSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sellerToProductSegue" {
            let destinationViewController = segue.destination as? ProductViewController
            destinationViewController?.currentProductIndex = currentProductIndex
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
