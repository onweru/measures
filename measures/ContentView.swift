//
//  ContentView.swift
//  measures
//
//  Created by dan on 10/12/19.
//  Copyright © 2019 dan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State private var unitsToConvert = ""
  @State private var fromUnits = 0
  @State private var toUnits = 0
  
  let timeUnits = ["seconds", "minutes", "hours"]
  
  var convertedUnits: Double {
    
    let units = Double(unitsToConvert) ?? 0
    let from = timeUnits[fromUnits]
    let to = timeUnits[toUnits]
    
    var result: Double = 0
    
    switch (from, to) {
    case ("seconds", "minutes"):
      result = units / 60 ;
    case ("seconds", "hours"):
      result = units / (60 * 60);
    case ("minutes", "seconds"):
      result = units * 60
    case ("minutes", "hours"):
      result = units / 60
    case ("hours", "seconds"):
      result = units * 60 * 60
    case ("hours", "minutes"):
      result = units * 60
    default:
      result = units
    }
    
    return result
  }
  
  
  var body: some View {
    NavigationView {
      
      Form {
        
        Section(header: Text("Units")) {
          TextField("Units to convert", text: $unitsToConvert)
            .keyboardType(.decimalPad)
        }
        
        Section(header: Text("From")) {
          Picker("From", selection: $fromUnits) {
            ForEach (0 ..< timeUnits.count) {
              Text(self.timeUnits[$0])
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("To")) {
          Picker("To", selection: $toUnits) {
            ForEach (0 ..< timeUnits.count) {
              Text(self.timeUnits[$0])
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Results")) {
          Text("\(convertedUnits, specifier: "%.1f")")
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
