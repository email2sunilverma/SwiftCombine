//
//  SEnvironment.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation

enum SEnvironmentType {
    case development
    case preprod
    case prod
}
class SEnvironment {
    static let shared = SEnvironment()
    private var environment: SEnvironmentType!
    
    private init() {
        #warning(" this need to make dynamic")
        environment = .development
    }
    func getTheBaseURL() -> String {
        return "http://127.0.0.1:8080/"
    }
    
    var currentEnv: SEnvironmentType {
        return environment
    }
}
