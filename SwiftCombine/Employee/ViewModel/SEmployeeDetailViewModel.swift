//
//  SEmployeeDetailViewModel.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 27/05/24.
//

import Foundation
import Combine
class SEmployeeDetailViewModel : ObservableObject {
    let employee: SEmployee
    @Published var empDetail: SEmployeeData?
    private var cancelable = Set<AnyCancellable>()
   
    init(employee: SEmployee) {
        self.employee = employee
    }
    
    func getEmployeeDetailData() {
//        let request = UrlRepository.employeeDetail(empId: "1").dataRequest
//        SNetworkManager.shared.performRequest(apiRequest: request, type:SEmployeeDetailResponse.self)
//            .sink { status in
//                print("satus: \(status)")
//            } receiveValue: { data in
//                print(" \(data)")
//                self.empDetail = data.data
//            }
//            .store(in: &cancelable)

#warning("Insecure api requred, some configuration to access http in iOS so used url")

       
        let url =  URL(string:UrlRepository.employeeDetail(empId: employee.id ?? "").url)!
        SNetworkManager.shared.performRequest(url: url, type:SEmployeeDetailResponse.self)
            .sink { status in
                print("satus: \(status)")
            } receiveValue: { data in
                print("ssssss \(data)")
                self.empDetail = data.data
            }
            .store(in: &cancelable)
    }
}
