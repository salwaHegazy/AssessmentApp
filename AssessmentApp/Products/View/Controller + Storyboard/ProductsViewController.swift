//
//  ProductsViewController.swift
//  AssessmentApp
//
//  Created by Salwa Hegazy on 22/10/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ProductsViewController: UIViewController {
    
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
        
    }
    
    //MARK: - Methods
    func setupTableView() {
       tableView.register(UINib(nibName: productsTableViewCell, bundle: nil), forCellReuseIdentifier: productsTableViewCell)
    }

}
