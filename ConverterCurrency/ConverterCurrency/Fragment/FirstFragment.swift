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

// Бангладеш - така +
// Гренландия - датская крона +
// Грузия - лари +
// Египет - египетский фунт +
// Индонезия - рупия

// This is a new commit

import Foundation
import SwiftUI

var models = [
    
    CurrencyModel(currencyImage: "flag_chines", currencyCurrency: "1₺ = 0.22 ¥", currencyCurrencyPerDollad: 0.22, currenyIcon: "¥", currencyNameShort: "CNY", currencyFullName: "China"),
    
    CurrencyModel(currencyImage: "flag_hong_kong", currencyCurrency: "1₺ = 0.24 $", currencyCurrencyPerDollad: 0.24, currenyIcon: "$", currencyNameShort: "HKD", currencyFullName: "Hong Kong"),
    
    CurrencyModel(currencyImage: "flag_hungary", currencyCurrency: "1₺ = 11.24 Ft.", currencyCurrencyPerDollad: 11.24, currenyIcon: "Ft.", currencyNameShort: "HUF", currencyFullName: "Hungary"),
    
    CurrencyModel(currencyImage: "flag_israel", currencyCurrency: "1₺ = 0.11 ₪", currencyCurrencyPerDollad: 0.11, currenyIcon: "₪", currencyNameShort: "NIS", currencyFullName: "Israel"),
    
    CurrencyModel(currencyImage: "flag_usa", currencyCurrency: "1₺ = 0.031 $", currencyCurrencyPerDollad: 0.031, currenyIcon: "$", currencyNameShort: "USD", currencyFullName: "USA"),
    
    // the later
    
    CurrencyModel(currencyImage: "flag_bangladesh", currencyCurrency: "1₺ =  3.41 ৳", currencyCurrencyPerDollad: 3.41, currenyIcon: "৳", currencyNameShort: "BDT", currencyFullName: "Bangladesh"),
    
    CurrencyModel(currencyImage: "flag_of_greenland", currencyCurrency: "1₺ = 0.21 kr.", currencyCurrencyPerDollad: 0.21, currenyIcon: "kr.", currencyNameShort: "DKK", currencyFullName: "Greenland"),
    
    CurrencyModel(currencyImage: "flag_of_georgia.svg", currencyCurrency: "1₺ = 0.084 GEL", currencyCurrencyPerDollad: 0.084, currenyIcon: "GEL", currencyNameShort: "GEL", currencyFullName: "Georgia"),
    
    CurrencyModel(currencyImage: "flag_of_egypt.svg", currencyCurrency: "1₺ = 1.45.ج.م", currencyCurrencyPerDollad: 1.45, currenyIcon: ". قرش", currencyNameShort: "EGP", currencyFullName: "Egypt"),
    
    CurrencyModel(currencyImage: "flag_of_indonesia.svg", currencyCurrency: "1₺ = 2.60 ₹", currencyCurrencyPerDollad: 2.60, currenyIcon: "₹", currencyNameShort: "INR", currencyFullName: "Indonesia"),
]

struct FirstFragment : View {
    
    @State var isShowAlert: Bool = false
    @State var currentModelForAlert: CurrencyModel? = nil
    
    var body: some View {
        NavigationView(
            content: {
                VStack {
  
                    Text("Bu bölümde, geniş bir döviz seçimi bulunan ve her birinin güncel fiyatlarıyla birlikte listelendiği bir bölüm bulunmaktadır.")
                        .foregroundColor(.black.opacity(0.5))
                        .italic()
                        .multilineTextAlignment(.center)

                    
                    List {
                        ForEach(models) { model in
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
                                    .swipeActions(edge: .leading) {
                                        Button(role: .destructive) {
                                            print("Hello World 1")
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        Button(
                                            role: .cancel,
                                            action: {
                                                currentModelForAlert = model
                                                isShowAlert = true
                                            },
                                            label: {
                                                Label("Info", systemImage: "info")
                                            }
                                        )
                                    }
                                    
                            }
                            
                        }
                    }
                }
                .navigationTitle("Ana")
                .background(Color.white)
                .alert(isPresented: $isShowAlert) {
                    Alert(
                        title: Text(currentModelForAlert?.currencyNameShort ?? "Error"),
                        message: Text(currentModelForAlert?.currencyCurrency ?? "Error"),
                        dismissButton: .default(Text("Got it!"))
                    )
                }
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


//    .swipeActions(edge: .leading) {
//        Button(role: .destructive) {
//                            print("Hello World 1")
//                        } label: {
//                            Label("Delete", systemImage: "trash")
//                        }
//                        Button { print("Hello World 2") } label: {
//                            Label("Flag", systemImage: "flag")
//                        }
//    }
