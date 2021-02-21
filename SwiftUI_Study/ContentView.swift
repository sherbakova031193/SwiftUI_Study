//
//  ContentView.swift
//  SwiftUI_Study
//
//  Created by Елизавета Щербакова on 21.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isAlert = false
    @State var isActionSheet = false
    @State var isOnToggle = false
    
    var body: some View {
        VStack {
            Text("VStack")
            ZStack {
                VStack {
                    Text("Menu1").frame(height: 50)
                    Text("Menu2").frame(height: 50)
                    Text("Menu3").frame(height: 50)
                    Text("Menu4").frame(height: 50)
                }.offset(x: -100)
                addView()
            }
            addToggle()
            showAlert()
            Spacer(minLength: 25)
            showActionSheet()
        }
        .padding()
    }
    
    fileprivate func addHStack() -> some View {
        return HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 13).fill(Color.yellow)
                Text("HStack")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 13).fill(Color.green)
                Text("HStack")
            }
        }.frame(width: 200, height: 100, alignment: .center)
    }
    
    fileprivate func addView() -> some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 13).fill(Color.blue)
            VStack {
                Text("ZStack")
                addHStack()
            }
        }.offset(x: isOnToggle ? 150: 0).animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.3))
    }

    fileprivate func addToggle() -> some View {
        return Toggle(isOn: $isOnToggle, label: {
            Text("Offset")
        })
    }
    
    fileprivate func showAlert() -> some View {
        return Button(action: {
            self.isAlert = true
        }, label: {
            Text("Show Alert")
        }).alert(isPresented: $isAlert, content: {
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
            self.isActionSheet = true
        }, label: {
            Text("Show Action Sheet")
        }).actionSheet(isPresented: $isActionSheet, content: {
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
