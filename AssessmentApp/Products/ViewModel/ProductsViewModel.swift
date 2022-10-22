//
//  ProductsViewModel.swift
//  AssessmentApp
//
//  Created by Salwa Hegazy on 22/10/2022.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire
import CoreData

class ProductsViewModel {
    //MARK: - Members
    private var isTableHidden = BehaviorRelay<Bool>(value: false)
    private var productsModelSubject = PublishSubject<[ProductModel]>()
    
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    var productsModelObservable: Observable<[ProductModel]> {
        return productsModelSubject
    }
    var isTableHiddenObservable: Observable<Bool> {
        return isTableHidden.asObservable()
    }
    
    //MARK: - Methods
    func getProductsData() {
        loadingBehavior.accept(true)
        APIService.instance.getData(endPoint: URLPath.getProductsData, method: .get, encoding: JSONEncoding.default) { [weak self] (productsModel: ProductsModel?, errorModel: BaseErrorModel?, error) in
            guard let self = self else { return }
            self.loadingBehavior.accept(false)
            
            if let error = error {
                
                print(error.localizedDescription)
                
            } else if let errorModel = errorModel {
                
                print(errorModel.message ?? "")
                
            } else {
                
                guard let productsModel = productsModel else { return }
                if productsModel.count  > 0 {
                    self.productsModelSubject.onNext(productsModel.values.map({$0}))
                    self.isTableHidden.accept(false)
                    self.saveData(products: productsModel.values.map({$0}))
                } else {
                    self.isTableHidden.accept(true)
                }
            }
        }
    }
    
    //MARK: - SaveData To CoreData
    func saveData(products : [ProductModel]){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //create an entity and new user records.
        let productEntity = NSEntityDescription.entity(forEntityName: "Product", in: managedContext)!
        
        //add products to newly created records
        
        for productItem in products {
            
            let product = NSManagedObject(entity: productEntity, insertInto: managedContext)
            product.setValue(productItem.id, forKeyPath: "id")
            product.setValue(productItem.name, forKey: "name")
            product.setValue(productItem.productsModelDescription, forKey: "product_description")
            product.setValue(productItem.barcode, forKey: "barcode")
            product.setValue(productItem.imageURL, forKey: "image")
            product.setValue(productItem.retailPrice, forKey: "retailPrice")
            product.setValue(productItem.costPrice, forKey: "costPrice")
        }
        
        //save products inside the Core Data
        
        do {
            try managedContext.save()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}

