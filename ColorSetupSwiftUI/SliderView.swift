//
//  SliderView.swift
//  ColorSetupSwiftUI
//
//  Created by Сергей Иванчихин on 21.04.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var colorValue: Double
    @State var colorString = ""
    let color: Color
    
    
    var body: some View {
        HStack(alignment: .center) {
            Text("value: " + String(lround(colorValue)))
                .frame(width: 80, alignment: .leading)
            
            Slider(value: $colorValue, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: colorValue) { newValue in
                    colorString = String(lround(newValue))
                }
            TextFieldView(colorString: $colorString, colorValue: $colorValue)
            
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(colorValue: .constant(10), colorString: "", color: .red)
    }
}

