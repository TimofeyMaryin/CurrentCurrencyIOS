//
//  CurrencyCard.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import Foundation
import SwiftUI


struct CurrencyModel : Identifiable {
    let id = UUID()
    var currencyImage: String
    var currencyCurrency: String
    var currencyCurrencyPerDollad: Float
    var currenyIcon: String
}

struct CurrencyCard : View {
    var model: CurrencyModel
    var body: some View {
        HStack(
            alignment: .center
        ) {
            Image(
                model.currencyImage
            )
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding([.horizontal], 20)
            
            Text("\(model.currencyCurrency)")
                .bold()
            
        }
    }
}



