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
                } else {
                    self.isTableHidden.accept(true)
                }
            }
        }
    }
    
}

