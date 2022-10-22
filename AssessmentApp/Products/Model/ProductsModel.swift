//
//  ProductsModel.swift
//  AssessmentApp
//
//  Created by Salwa Hegazy on 22/10/2022.
//

import Foundation

// MARK: - Product
class ProductModel: Codable {
    let barcode, productsModelDescription, id: String
    let imageURL: String?
    let name: String?
    let retailPrice: Int?
    let costPrice: Int?
    var count: Int?

    enum CodingKeys: String, CodingKey {
        case barcode
        case productsModelDescription = "description"
        case id
        case imageURL = "image_url"
        case name
        case retailPrice = "retail_price"
        case costPrice = "cost_price"
    }
}

typealias ProductsModel = [String: ProductModel]
