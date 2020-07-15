//
//  ContentView.swift
//  Converter
//
//  Created by Antoine on 15/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var converter = Converter()
    @State var str: String = ""
    
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5.0).stroke()
                    .frame(maxHeight: 100)
                HStack {
                    TextField("", text: $str)
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .frame(minHeight: 50, maxHeight: 70)
                        .padding(.horizontal, 10)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).fill(Color(UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1)))
                            .frame(minHeight: 50, maxHeight: 70)
                            .frame(minWidth: 50, maxWidth: 100)
                        HStack {
                            Text("ml")
                            Image(systemName: "chevron.down")
                        }
                    }
                }.padding()
            }.padding()
            
            Spacer()
            
            Arrow()
                .foregroundColor(Color(UIColor.lightGray))
                .opacity(0.1)
                .frame(minHeight: 20, maxHeight: 50)
                .frame(minWidth: 100, maxWidth: .infinity)
                .padding()
            
//            Picker(selection: $converter.baseUnit, label: Text("From")) {
//                ForEach(0..<converter.unitsDescription.count) { i in
//                    Text(self.converter.unitsDescription[i])
//                }
//            }.id(converter.conversionType) // Change Picker's ID to force reload data
//
//            Spacer()
//
//            Picker(selection: $converter.targetUnit, label: Text("To")) {
//                ForEach(0..<converter.unitsDescription.count) { i in
//                    Text(self.converter.unitsDescription[i])
//                }
//            }.id(converter.conversionType) // Change Picker's ID to force reload data
            
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
