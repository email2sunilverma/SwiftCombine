//
//  SButton.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SButton: View {
    let action: () -> Void
    let label: String
    @State var color: Color = Color("appButtonBGColor")
    @State var titleColor: Color = .white
    
    var body: some View {
        HStack {
            Button(action: action) {
                Text(label)
                    .font(.headline)
                    .foregroundColor(titleColor)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(color)
                
            }
            .cornerRadius(10)
            .buttonStyle(.automatic)
            
        }
        .padding(.horizontal)
        
    }
}
struct SButton_Previews: PreviewProvider {
    static var previews: some View {
        SButton(action: {
            
        }, label: "TEST")
    }
}
