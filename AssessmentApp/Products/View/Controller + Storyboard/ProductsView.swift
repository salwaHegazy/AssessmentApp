//
//  ProductsViewController.swift
//  AssessmentApp
//
//  Created by Salwa Hegazy on 22/10/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ProductsView: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Members
    let productsTableViewCell = "ProductsTableViewCell"
    let productsViewModel = ProductsViewModel()
    let disposeBag = DisposeBag()
    
    // MARK: - View's Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        subscribeToLoading()
        subscribeToResponse()
        subscribeToProductSelection()
    }
    
    //MARK: - Methods
    func setupTableView() {
       tableView.register(UINib(nibName: productsTableViewCell, bundle: nil), forCellReuseIdentifier: productsTableViewCell)
    }
    
    func subscribeToLoading() {
        productsViewModel.loadingBehavior.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showIndicator(withTitle: "", and: "")
            } else {
                self.hideIndicator()
            }
        }).disposed(by: disposeBag)
    }
    
    func subscribeToResponse() {
        productsViewModel.productsModelObservable
            .bind(to: tableView
                .rx
                .items(cellIdentifier: productsTableViewCell,
                       cellType: ProductsTableViewCell.self)) { row, product, cell in
                        print(row)
                cell.config(product: product)
        }
        .disposed(by: disposeBag)
    }
    
    func subscribeToProductSelection() {
        Observable
            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(ProductsModel.self))
            .bind { [weak self] selectedIndex, product in
                
                print(selectedIndex, product.values)
        }
        .disposed(by: disposeBag)
    }
    
    func getProducts() {
        productsViewModel.getProductsData()
    }
    
}

 
