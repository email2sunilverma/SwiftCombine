//
//  SLazyView.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import SwiftUI

struct SLazyView<T: View>: View {
     var view:() -> T
    var body: some View {
        self.view()
    }
}

struct SLazyView_Previews: PreviewProvider {
    static var previews: some View {
        SLazyView {
            Text("ssss")
        }
    }
}
