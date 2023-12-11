//
//  SearchResultViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

class SearchResultViewController: UIViewController {

    var currentProductName = ""
    var currentProductIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func productButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "searchResultToProductSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchResultToProductSegue" {
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
