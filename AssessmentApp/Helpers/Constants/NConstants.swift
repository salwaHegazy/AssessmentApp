//
//  NConstants.swift
//  AssessmentApp
//
//  Created by Salwa Hegazy on 22/10/2022.
//

import Foundation

// MARK: - Paths Handling

protocol Endpoint {
    var path: String { get }
}

enum URLPath {
    case getProductsData
}

extension URLPath: Endpoint {
    var path: String {
        switch self {
        case .getProductsData: return fullURL("https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba")
        
        }
    }
}

private func fullURL(_ path: String) -> String {
    return path
}
