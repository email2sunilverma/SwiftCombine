//
//  SEmployeeDetailResponse.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation


// MARK: - Welcome
struct SEmployeeDetailResponse: Codable {
    let code: Int?
    let message: String?
    let data: SEmployeeData?
}

// MARK: - SEmployee
struct SEmployeeData: Codable {
    let id, name, age: String?
}
