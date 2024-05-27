//
//  SEmployeeViewModel.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation
import Combine

class SEmployeeViewModel: ObservableObject {
    @Published var employees: [SEmployee]?
    private var cancelable = Set<AnyCancellable>()
    func getEmployeeData() {
//        let request = UrlRepository.employee.dataRequest
//        SNetworkManager.shared.performRequest(apiRequest: request, type:SEmployeeResponnse.self)
//            .sink { status in
//                print("satus: \(status)")
//            } receiveValue: { data in
//                print(" \(data)")
//                self.employees = data.data

//            }
//            .store(in: &cancelable)

        
        #warning("Insecure api requred some configuration to access http in iOS, so used url")
        
        let url =  URL(string:UrlRepository.employee.url)!
        SNetworkManager.shared.performRequest(url: url, type:SEmployeeResponnse.self)
            .sink { status in
                print("satus: \(status)")
            } receiveValue: { data in
                print(" \(data)")
                self.employees = data.data
            }
            .store(in: &cancelable)
    }
}
