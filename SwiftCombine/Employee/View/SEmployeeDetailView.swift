//
//  SEmployeeDetailView.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SEmployeeDetailView: View {
    @StateObject var viewModel: SEmployeeDetailViewModel
    var body: some View {
        VStack {
            Text(viewModel.empDetail?.name ?? "")
            Text(viewModel.empDetail?.age ?? "")
        }.onAppear() {
            viewModel.getEmployeeDetailData()
        }
    }
}

struct SEmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SEmployeeDetailView(viewModel: SEmployeeDetailViewModel(employee: SEmployee(id: "1", name: "sss", age: "23")))
    }
}
