//
//  SLabel.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SLabel: View {
   @State var text: String = ""
    var body: some View {
        Text(text)
            .font(.body)
            .foregroundColor(Color("appLabelTextColor"))
    }
}

struct SLabel_Previews: PreviewProvider {
    static var previews: some View {
        SLabel(text: "")
    }
}
