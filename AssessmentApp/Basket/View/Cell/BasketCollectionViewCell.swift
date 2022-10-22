//
//  BasketCollectionViewCell.swift
//  AssessmentApp
//
//  Created by Salwa Hegazy on 22/10/2022.
//

import UIKit
import Kingfisher

class BasketCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var basketImage: UIImageView!
    @IBOutlet weak var basketItemName: UILabel!
    @IBOutlet weak var basketItemPrice: UILabel!
    @IBOutlet weak var deleteItemBtn: UIButton!
    @IBOutlet weak var editItemBtn: UIButton!
    
    func config (basketItemName: String ,basketItemPrice: String ,cartItemCounts : Int , imageUrl : String) {
         self.basketItemName.text = basketItemName
         self.basketItemPrice.text = basketItemPrice
         let url = URL(string: imageUrl)
         basketImage.kf.setImage(with: url)
     }
}
