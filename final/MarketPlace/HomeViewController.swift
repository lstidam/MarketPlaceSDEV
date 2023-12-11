//
//  HomeViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var currentProductIndex = 0
    var currentProductName = ""
    var currentUserName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUserName = loggedInUserName
        // Do any additional setup after loading the view.
    }

    @IBAction func sellerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToSellerSegue", sender: self)
    }
    
    @IBAction func productButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToProductSegue", sender: self)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToSearchResultSegue", sender: self)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToProfileSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToSellerSegue" {
            let destinationViewController = segue.destination as? SellerViewController
            destinationViewController?.currentUserName = currentUserName
        }
        if segue.identifier == "homeToSearchResultSegue" {
            let destinationViewController = segue.destination as? SearchResultViewController
            destinationViewController?.currentProductName = currentProductName
        }
        if segue.identifier == "homeToProductSegue" {
            let destinationViewController = segue.destination as? ProductViewController
            destinationViewController?.currentProductIndex = currentProductIndex
            destinationViewController?.currentUserName = currentUserName
        }
        if segue.identifier == "homeToProfileSegue" {
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
