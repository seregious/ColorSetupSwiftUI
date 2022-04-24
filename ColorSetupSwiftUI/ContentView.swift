//
//  ContentView.swift
//  ColorSetupSwiftUI
//
//  Created by Сергей Иванчихин on 21.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var redValue = Double.random(in: 0...255)
    @State var greenValue = Double.random(in: 0...255)
    @State var blueValue = Double.random(in: 0...255)
    
    var color: Color {
        Color.init(red: redValue/255, green: greenValue/255, blue: blueValue/255)
    }
    
    @FocusState var inFocus: Bool
    
    var body: some View {
        VStack{
            
            RoundedRectangle(cornerRadius: 25)
                .fill(color)
                .frame(width: 250, height: 250)
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(lineWidth: 5)
                }
            Group{
                SliderView(colorValue: $redValue, color: .red)
                SliderView(colorValue: $greenValue, color: .green)
                SliderView(colorValue: $blueValue, color: .blue)
            }
            .focused($inFocus)
        }
        .focused($inFocus)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    inFocus = false
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
