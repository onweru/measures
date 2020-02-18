//
//  ContentView.swift
//  measures
//
//  Created by dan on 10/12/19.
//  Copyright © 2019 dan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State private var units = ""
  @State private var selectedInputUnit = 0
  @State private var selectedOutputUnit = 1
  
  let conversionUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
  var results: Double {
    
    let tempUnits = Double(units) ?? 0
    
    switch (selectedInputUnit, selectedOutputUnit) {
    case (0, 1):
        return (tempUnits * 9 / 5) + 32
    case (0, 2):
        return tempUnits + 273.15
    case (1, 0):
        return (tempUnits - 32) * 5 / 9
    case (1, 2):
        return ((tempUnits - 32) * 5 / 9) + 273.15
    case (2, 0):
        return tempUnits - 273.15
    case (2, 1):
        return ((tempUnits - 273.15) * 9 / 5) + 32
    default:
        return tempUnits
    }

  }
  
  var body: some View {
    Form {
        Section(header: Text("Units to convert")) {
            TextField("Enter Units", text: $units).keyboardType(.decimalPad)
        }
        
        Section(header: Text("Input Units")) {
            Picker("Units Label", selection: $selectedInputUnit) {
                ForEach(0 ..< conversionUnits.count) {
                    Text("\(self.conversionUnits[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Output Units")) {
            Picker("Units Label", selection: $selectedOutputUnit) {
                ForEach(0 ..< conversionUnits.count) {
                    Text("\(self.conversionUnits[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Conversion Results")) {
            Text("\(results, specifier: "%.2f")")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
