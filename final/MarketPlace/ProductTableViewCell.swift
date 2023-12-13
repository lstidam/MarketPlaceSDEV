//
//  ProductTableViewCell.swift
//  MarketPlace
//
//  Created by Lillia Noel Stidam on 12/13/23.
//

import UIKit


class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    private var title: String = ""
    
    static func nib() -> UINib{
        return UINib(nibName: "ProductTableViewCell", bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

        // Configure the view for the selected state
}
    
