//
//  AdditionalFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import Foundation
import SwiftUI
import Combine
import UniformTypeIdentifiers
import MobileCoreServices


struct AdditionalFragmetModel {
    var image: String
    var pricePerOneDollad: Float
    var currencyIcon: String
}

struct AdditionalFragment : View {
    var model: AdditionalFragmetModel
    @State var textField = ""
    
    
    var body: some View {
        VStack {
            Image(model.image).resizable().frame(width: 150, height: 150).clipShape(Circle())
            Spacer()
            Text("\(String(model.pricePerOneDollad))\(model.currencyIcon) = 1$")
                .font(.headline)
            Spacer()
            
            TextField("Write here...", text: $textField)
                .padding(.horizontal, 20)
                .keyboardType(.numberPad)
                .onReceive(Just(textField)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.textField = filtered
                                }
                            }
            Spacer()
            Text("You Get a \(calculateCurrency(value: textField, currencyPrice: model.pricePerOneDollad))")
            Spacer()
            Button(action: {
                UIPasteboard.general.string = String(calculateCurrency(value: textField, currencyPrice: model.pricePerOneDollad))
                UIPasteboard.general.setValue(
                    calculateCurrency(value: textField, currencyPrice: model.pricePerOneDollad),
                    forPasteboardType: UTType.plainText.identifier
                )
            }, label: {
                Image(systemName: "doc.on.doc.fill")
            })
            Spacer()
            Spacer()
        }
    }
}

private func setValue(valuee: String) -> Float  {
    return if (valuee.isEmpty) { 0 } else { valuee.floatValue }
}


private func calculateCurrency(value: String, currencyPrice: Float) -> Float  {
    
    return setValue(valuee: value) * currencyPrice
}




extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

