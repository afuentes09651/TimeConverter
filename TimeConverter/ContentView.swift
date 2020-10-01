//
//  ContentView.swift
//  TimeConverter
//
//  Created by Armando Fuentes on 9/25/20.
//  Copyright © 2020 Armando Fuentes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var selectedFrom = 0
    @State private var selectedTo = 0
    let times = ["seconds","minutes", "hours"]
    
    var strengths = ["Mild", "Medium", "Mature"]

    @State private var selectedStrength = 0
    
    var result: Double{
        var from = Double(input) ?? 0
        var to = 0.0
        
        switch(selectedFrom){
        case 0:
            break
        case 1:
            from *= 60
            break
        case 2:
            from *= 60 * 60
            break
        default:
            from = 0
        }
        
        switch(selectedTo){
        case 0:
            to = from
            break
        case 1:
            to = from / 60
            break
        case 2:
            to = (from / 60) / 60
            break
        default:
            to = 0.0
        }
        
        return to
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedStrength, label: Text("Strength")) {
                        ForEach(0 ..< strengths.count) {
                            Text(self.strengths[$0])

                        }
                    }
                }
                TextField("Enter time value", text: $input).keyboardType(.decimalPad)
                
                Section(header: Text("Enter the inital unit")){
                    Picker("From Unit", selection: $selectedFrom) {
                         ForEach(0 ..< times.count) {
                            Text(self.times[$0])
                         }
                     }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Enter the resulting unit")){
                    Picker("To Unit", selection: $selectedTo){
                    ForEach(0..<times.count){
                        Text(self.times[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
             Text("\(result,specifier: "%.2f")")
            }
                
        .navigationBarTitle(Text("Time Converter"))
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
