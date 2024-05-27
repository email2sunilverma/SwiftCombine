//
//  URLRepository.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation


enum UrlRepository {
    case employee
    case employeeDetail(empId: String)
    var dataRequest: APIRequest {
        switch self {
        case .employee:
            return APIRequest(path: "employee", method: .get)
        case .employeeDetail(let empId):
            return APIRequest(path: "employeeDetail/\(empId)", method: .get)
        }
    }
}

extension UrlRepository {
    var url: String {
        var path = ""
        switch self {
        case .employee:
            path = "employee"
        case .employeeDetail(let empId):
            path = "employeeDetail/\(empId)"
        }
        
        return SEnvironment.shared.getTheBaseURL() + path
    }
}
