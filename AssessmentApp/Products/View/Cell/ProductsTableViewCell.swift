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
    
    var cart:BasketResponse??
    var basketsresponse: ProductModel?? = nil
    
    func config(products : ProductModel){
        self.productNameLabel.text = products.name
        let url = URL(string: products.imageURL ?? "noproducts")
        self.productImage.kf.setImage(with: url)
        self.basketsresponse = products
        self.currentQuantity.text = "\(basketsresponse!!.count ?? 0)"
        
    }
    
    @IBAction func decreaseQuantityBtn(_ sender: Any) {
        var currentNum =  Int(self.currentQuantity.text!)!
        if (currentNum <= 0 ) {
            currentNum =  0 ;
            self.currentQuantity.text! = String(currentNum)
            basketsresponse!!.count = currentNum
        }else {
            currentNum -= 1
            self.currentQuantity.text! = String(currentNum)
            basketsresponse!!.count = currentNum
        }
        addToCart(quantity: currentNum, productResponse: basketsresponse!! , isplus: false)
    }
    
    @IBAction func increaseQuantityBtn(_ sender: Any) {
        var currentNum =  Int(self.currentQuantity.text!)!
        if (currentNum < 1000 ) {
        currentNum += 1
        self.currentQuantity.text! = String(currentNum)
        basketsresponse!!.count = currentNum
        addToCart(quantity: currentNum, productResponse: basketsresponse!! , isplus: true)
        }
        else
        {
        currentNum = 0;
        self.currentQuantity.text! = String(currentNum)
        basketsresponse!!.count = currentNum
        }
    }

    func addToCart(quantity: Int , productResponse: ProductModel , isplus : Bool) {
        if (Constants.basketResponse == nil) {
            if (isplus || (isplus == false && quantity != 0) ) {
              Constants.basketResponse  = BasketResponse()
                productResponse.count = quantity
              Constants.basketResponse!!.products.append(productResponse)
              return
            }
           }
           else   if (!Constants.basketResponse!!.products.contains(where: { $0.id == productResponse.id })) {
            if (isplus || (isplus == false && quantity != 0) ) {
                productResponse.count = quantity
              Constants.basketResponse!!.products.append(productResponse)
              return
            }
        }
        else if (Constants.basketResponse!!.products.contains(where: { $0.id == productResponse.id })) {
            let pos:Int = Constants.basketResponse!!.products.firstIndex(where: { $0.id == productResponse.id})!
            if(isplus){
            Constants.basketResponse!!.products[pos].count = quantity
            } else {
            if (quantity == 0){
                Constants.basketResponse!!.products.remove(at: pos)
                Constants.basketResponse!!.total_price = 0
            } else {
                Constants.basketResponse!!.products[pos].count = quantity
            }
            
            }
            return
        }
    }
    
}
