//
//  SBindLabel.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SBindLabel: View {
    @Binding var text: String
     var body: some View {
         Text($text.wrappedValue)
             .font(.body)
             .foregroundColor(Color("appLabelTextColor"))
     }
}

struct SBindLabel_Previews: PreviewProvider {
    static var previews: some View {
        SBindLabel(text: .constant("Label"))
    }
}
