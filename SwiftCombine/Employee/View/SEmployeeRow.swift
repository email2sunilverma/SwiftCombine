//
//  SEmployeeRow.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SEmployeeRow: View {
    let employee: SEmployee
    var body: some View {
        HStack {
            SLabel(text: employee.name ?? "")
        }.padding(.horizontal)
        
    }
}

struct SEmployeeRow_Previews: PreviewProvider {
    static var previews: some View {
        SEmployeeRow(employee: SEmployee(id: "1", name: "SSS", age: "22"))
    }
}
