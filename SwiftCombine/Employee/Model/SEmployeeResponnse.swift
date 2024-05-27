//
//  SEmployeeResponnse.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation

// MARK: - Welcome
struct SEmployeeResponnse: Codable {
    let code: Int?
    let message: String?
    let data: [SEmployee]?
}

// MARK: - SEmployee
struct SEmployee: Codable {
    let id, name, age: String?
}

