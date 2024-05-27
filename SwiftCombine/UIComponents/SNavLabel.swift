//
//  SNavLabel.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SNavLabel: View {
    @Binding var text: String
    var body: some View {
        Text($text.wrappedValue)
            .font(.title3)
            .foregroundColor(Color("appNavBarTitleColor"))
    }
}

struct SNavLabel_Previews: PreviewProvider {
    static var previews: some View {
        SNavLabel(text: .constant("FEATURE"))
    }
}
