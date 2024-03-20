//
//  SelectCurrencyCard.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//


import Foundation
import SwiftUI

struct SelectCurrencyModel : Identifiable {
    let id = UUID()
    let name: String
    let img: String
}

struct SelectCurrencyCard : View {
    var model: SelectCurrencyModel
    var selected: Bool
    var onClick: () -> Void

    
    var body: some View {
        Button(
            action: {
                onClick()
            }, label: {
                HStack(
                    alignment: .center
                ) {
                    Image(model.img)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(model.name)
                    Spacer(minLength: 1)
                    if (selected) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.red)
                    }
                    
                }
                .padding([.vertical], 10)
                .padding([.horizontal], 20)
        })
        
        
    }
}

