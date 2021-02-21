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
    
    @State var section = 0
    var settingsTime = ["1 min", "2 min", "3 min", "4 min", "5 min"]
    
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    addPicker()
                    addToggle()
                }
                .navigationBarTitle("Settings")
                
            }
        }
    }
    
    
    fileprivate func addPicker() -> Picker<Text, Int, ForEach<Range<Int>, Int, Text>> {
        return Picker(selection: $section, label: Text("Time"), content: {
            ForEach(0..<settingsTime.count) {
                Text(settingsTime[$0])
            }
        })
    }
    
    fileprivate func firstLessonView() -> some View {
        return VStack {
            Text("VStack")
            ZStack {
                addMenu()
                addView()
            }
            addToggle()
            showAlert()
            Spacer(minLength: 25)
            showActionSheet()
        }
        .padding()
    }
    
    fileprivate func addMenu() -> some View {
        return VStack {
            Text("Menu1").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).frame(height: 50)
            Text("Menu2").foregroundColor(.yellow).frame(height: 50)
            Text("Menu3").foregroundColor(.pink).frame(height: 50)
            Text("Menu4").foregroundColor(.orange).frame(height: 50)
        }.offset(x: -100)
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
