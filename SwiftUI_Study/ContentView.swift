//
//  ContentView.swift
//  SwiftUI_Study
//
//  Created by Елизавета Щербакова on 21.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isError = false
    
    var body: some View {
        showAlert()
    }
    
    fileprivate func showAlert() -> some View {
        return Button(action: {
            self.isError = true
        }, label: {
            Text("Show Alert")
        }).alert(isPresented: $isError, content: {
                    Alert(title: Text("Alert"),
                          message: Text("Alert Test"),
                          primaryButton: .default(Text("Ok"), action: {
                            print("Alert action")
                          }),
                          secondaryButton: .cancel())
                 })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
