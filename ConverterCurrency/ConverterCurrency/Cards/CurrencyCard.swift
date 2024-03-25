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
    var currencyNameShort: String
    var currencyFullName: String
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
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .cornerRadius(10)
                .padding([.horizontal], 20)
                .shadow(color: .black, radius: 3)
            
            Text("\(model.currencyCurrency)")
                .bold()
            
            Text(" (\(model.currencyFullName))")
                .bold()
                .foregroundColor(.gray)
            
        }
    }
}



