//
//  ProfileViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

//test 123

import UIKit

class ProfileViewController: UIViewController {

    var currentUserName = ""
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var savedImage: UIImageView!
    @IBOutlet var sellingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    func updateUI() {
        let currentProduct = products[0]
        userNameLabel.text = currentProduct.productUserName
        savedImage.image = currentProduct.productImage
        sellingImage.image = currentProduct.productImage
        
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
