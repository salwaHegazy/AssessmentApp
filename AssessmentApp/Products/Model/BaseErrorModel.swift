//
//  BaseErrorModel.swift
//  AssessmentApp
//
//  Created by Salwa Hegazy on 22/10/2022.
//

import Foundation

struct BaseErrorModel: Codable {
    let message: String?
    let status_code: Int?
}
