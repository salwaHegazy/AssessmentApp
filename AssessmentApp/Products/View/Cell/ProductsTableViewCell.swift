//
//  ProductsTableViewCell.swift
//  AssessmentApp
//
//  Created by Salwa Hegazy on 22/10/2022.
//

import UIKit
import Kingfisher


class ProductsTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    
    func config(product : ProductModel){
        self.productNameLabel.text = product.name
        let url = URL(string: product.imageURL ?? "noproducts")
        self.productImage.sd_setImage(with: url, placeholderImage: UIImage(named: "noproducts"))
    }
    
    
}
