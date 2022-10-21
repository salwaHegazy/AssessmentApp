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
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
