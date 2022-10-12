//
//  ContentView.swift
//  ChallengeOne
//
//  Created by Muhammad Rizqullah Akbar on 12/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var valueOne: Double = 0.0
    @State var unitOne: String = "Celcius"
    @State var unitTwo: String = "Celcius"
    @State var unit = ["Celcius", "Fahrenheit", "Kelvin"]
    @FocusState var keyboardIsFocused: Bool
    
    var toCelcius: Double {
        if unitOne == "Fahrenheit" {
            let val = (valueOne - 32) * 5 / 9
            return val
        }
        else if unitOne == "Kelvin" {
            let val = valueOne - 273.15
            return val
        }
        else {
            return valueOne
        }
    }
    
    var result: Double {
        if unitTwo == "Fahrenheit" {
            let val = (toCelcius * 9 / 5) + 32
            return val
        }
        else if unitTwo == "Kelvin" {
            let val = toCelcius + 273.15
            return val
        }
        else {
            return toCelcius
        }
            
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Picker("Units", selection: $unitOne) {
                        ForEach(unit, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("UNIT")
                }
                
                Section {
                    Picker("Units", selection: $unitTwo) {
                        ForEach(unit, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("UNIT")
                }
                
                Section {
                    TextField("Value", value: $valueOne, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsFocused)
                } header: {
                    Text("VALUE")
                }
                
                Section {
                    Text(result.formatted())
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Challenge One")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        keyboardIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
