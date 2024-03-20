//
//  FirstFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

// 5 стран
//  США - Доллар
// Венгрия - форинт
// Гонконг - гонконгский доллар
// Израиль - Шекель
// Китай - Юань
// Символ Лиры - ₺

// This is a new commit

import Foundation
import SwiftUI

private var models = [
//    CurrencyModel(currencyImage: "china", currencyCurrency: "1 ₹ = 0.034 €", currencyCurrencyPerDollad: 0.034, currenyIcon: "₹", currencyNameShort: "CNY"),
//    CurrencyModel(currencyImage: "france", currencyCurrency: "1 ₹ = 0.024 $", currencyCurrencyPerDollad: 0.024, currenyIcon: "₹", currencyNameShort: "EUR"),
//    CurrencyModel(currencyImage: "germany", currencyCurrency: "1 $ = 3.034 €", currencyCurrencyPerDollad: 3.034, currenyIcon: "€", currencyNameShort: "EUR"),
//    CurrencyModel(currencyImage: "united-kingdom", currencyCurrency: "1 $ = 2.004 €", currencyCurrencyPerDollad: 2.004, currenyIcon:"€", currencyNameShort: "GBP"),
//    CurrencyModel(currencyImage: "united-states", currencyCurrency: "1 $ = 96.34 ₽", currencyCurrencyPerDollad: 96.34, currenyIcon: "₽", currencyNameShort: "USD"),
    
    
    CurrencyModel(currencyImage: "flag_chines", currencyCurrency: "1₺ = 0.22 ¥", currencyCurrencyPerDollad: 0.22, currenyIcon: "¥", currencyNameShort: "CNY"),
    
    CurrencyModel(currencyImage: "flag_hong_kong", currencyCurrency: "1₺ = 0.24 $", currencyCurrencyPerDollad: 0.24, currenyIcon: "$", currencyNameShort: "HKD"),
    
    CurrencyModel(currencyImage: "flag_hungary", currencyCurrency: "1₺ = 11.24 Ft.", currencyCurrencyPerDollad: 11.24, currenyIcon: "Ft.", currencyNameShort: "HUF"),
    
    CurrencyModel(currencyImage: "flag_israel", currencyCurrency: "1₺ = 0.11 ₪", currencyCurrencyPerDollad: 0.11, currenyIcon: "₪", currencyNameShort: "NIS"),
    
    CurrencyModel(currencyImage: "flag_usa", currencyCurrency: "1₺ = 0.031 $", currencyCurrencyPerDollad: 0.031, currenyIcon: "$", currencyNameShort: "USD")
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
