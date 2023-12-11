//
//  SellingTableViewCell.swift
//  MarketPlace
//
//  Created by Lillia Noel Stidam on 12/11/23.
//

import UIKit

class SellingTableViewCell: UITableViewCell {
    
    @IBOutlet var sellingLabel: UILabel!
    @IBOutlet var sellingImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
