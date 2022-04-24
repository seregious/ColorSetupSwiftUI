//
//  TextFieldView.swift
//  ColorSetupSwiftUI
//
//  Created by Сергей Иванчихин on 24.04.2022.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var showAlert = false
    @Binding var colorString: String
    @Binding var colorValue: Double


    var body: some View {
        TextField(colorString, text: $colorString) { _ in
            checkField()
        }
        .frame(width: 50, alignment: .trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Number must be from 0 to 255", isPresented: $showAlert) {}
    }
    
    private func checkField() {
        if let number = Double(colorString), (0...255).contains(number) {
            colorValue = number
        } else {
            showAlert.toggle()
            colorString = "0"
            colorValue = 0
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(colorString: .constant(""), colorValue: .constant(0))
    }
}
