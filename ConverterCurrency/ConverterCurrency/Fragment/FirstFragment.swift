//
//  FirstFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//


import Foundation
import SwiftUI

private var models = [
    CurrencyModel(currencyImage: "china", currencyCurrency: "1 ₹ = 0.034 €", currencyCurrencyPerDollad: 0.034, currenyIcon: "₹"),
    CurrencyModel(currencyImage: "france", currencyCurrency: "1 ₹ = 0.024 $", currencyCurrencyPerDollad: 0.024, currenyIcon: "₹"),
    CurrencyModel(currencyImage: "germany", currencyCurrency: "1 $ = 3.034 €", currencyCurrencyPerDollad: 3.034, currenyIcon: "€"),
    CurrencyModel(currencyImage: "united-kingdom", currencyCurrency: "1 $ = 2.004 €", currencyCurrencyPerDollad: 2.004, currenyIcon:"€"),
    CurrencyModel(currencyImage: "united-states", currencyCurrency: "1 $ = 96.34 ₽", currencyCurrencyPerDollad: 96.34, currenyIcon: "₽"),
]

struct FirstFragment : View {
    var body: some View {
        NavigationView(
            content: {
                VStack {
                    List(models) { model in
                        NavigationLink(
                            destination: {
                                AdditionalFragment(
                                    model: AdditionalFragmetModel(
                                        image: model.currencyImage,
                                        pricePerOneDollad: model.currencyCurrencyPerDollad,
                                        currencyIcon: model.currenyIcon
                                    )
                                )
                            }
                        ) {
                                CurrencyCard(model: model)
                        }
                        .padding()
                    }
                }
                .navigationTitle("Main")
                .background(Color.black)
                
            }
        )
    }
}
