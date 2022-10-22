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
    @IBOutlet weak var currentQuantity: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    
    func config(product : ProductModel){
        self.productNameLabel.text = product.name
        let url = URL(string: product.imageURL ?? "noproducts")
        self.productImage.kf.setImage(with: url)
        
    }
    
    @IBAction func decreaseQuantityBtn(_ sender: Any) {
        
    }
    
    
    @IBAction func increaseQuantityBtn(_ sender: Any) {
        
    }
}
