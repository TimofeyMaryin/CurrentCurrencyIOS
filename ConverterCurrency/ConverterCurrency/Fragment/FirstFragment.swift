//
//  FirstFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//


// This is a new commit

import Foundation
import SwiftUI

private var models = [
    CurrencyModel(currencyImage: "china", currencyCurrency: "1 ₹ = 0.034 €", currencyCurrencyPerDollad: 0.034, currenyIcon: "₹", currencyNameShort: "CNY"),
    CurrencyModel(currencyImage: "france", currencyCurrency: "1 ₹ = 0.024 $", currencyCurrencyPerDollad: 0.024, currenyIcon: "₹", currencyNameShort: "EUR"),
    CurrencyModel(currencyImage: "germany", currencyCurrency: "1 $ = 3.034 €", currencyCurrencyPerDollad: 3.034, currenyIcon: "€", currencyNameShort: "EUR"),
    CurrencyModel(currencyImage: "united-kingdom", currencyCurrency: "1 $ = 2.004 €", currencyCurrencyPerDollad: 2.004, currenyIcon:"€", currencyNameShort: "GBP"),
    CurrencyModel(currencyImage: "united-states", currencyCurrency: "1 $ = 96.34 ₽", currencyCurrencyPerDollad: 96.34, currenyIcon: "₽", currencyNameShort: "USD"),
]

struct FirstFragment : View {
    var body: some View {
        NavigationView(
            content: {
                VStack {
                    Text("Bu bölümde, geniş bir döviz seçimi bulunan ve her birinin güncel fiyatlarıyla birlikte listelendiği bir bölüm bulunmaktadır.")
                        .foregroundColor(.black.opacity(0.5))
                        .italic()
                        .multilineTextAlignment(.center)
                    List(models) { model in
                        NavigationLink(
                            destination: {
                                AdditionalFragment(
                                    model: AdditionalFragmetModel(
                                        image: model.currencyImage,
                                        pricePerOneDollad: model.currencyCurrencyPerDollad,
                                        currencyIcon: model.currenyIcon,
                                        currencyShortName: model.currencyNameShort
                                    )
                                )
                            }
                        ) {
                                CurrencyCard(model: model)
                        }
                        .padding()
                    }
                    
                }
                .navigationTitle("Ana")
                .background(Color.white)
                
            }
        )
    }
}


//VStack {
////                    Image("modern-image")
////                        .frame(height: 120)
//        
//    List(models) { model in
//        NavigationLink(
//            destination: {
//                AdditionalFragment(
//                    model: AdditionalFragmetModel(
//                        image: model.currencyImage,
//                        pricePerOneDollad: model.currencyCurrencyPerDollad,
//                        currencyIcon: model.currenyIcon,
//                        currencyShortName: model.currencyNameShort
//                    )
//                )
//            }
//        ) {
//                CurrencyCard(model: model)
//        }
//        .padding()
//    }
//    
//}
//.navigationTitle("Ana")
//.background(Color.white)
