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
        showActionSheet()
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
    
    fileprivate func showActionSheet() -> some View {
        return Button(action: {
            self.isError = true
        }, label: {
            Text("Show Action Sheet")
        }).actionSheet(isPresented: $isError, content: {
            ActionSheet(title: Text("Action Sheet"),
                        message: Text("Test Action Sheet"),
                        buttons: [.default(Text("Test 1"), action: {
                            print("Test 1")
                        }),
                        .default(Text("Test 2"), action: {
                            print("Test 2")
                        }),
                        .cancel()
                        ])
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
