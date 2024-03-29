//
//  SecondaFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import Foundation
import SwiftUI

private var currencyModel = [
    SelectCurrencyModel(name: "Pound £", img: "currency_1"),
    SelectCurrencyModel(name: "Lyra ₺", img: "currency_2"),
    SelectCurrencyModel(name: "Евро €", img: "currency_3"),
    SelectCurrencyModel(name: "Euro GEL", img: "currency_4"),
    SelectCurrencyModel(name: "Ruble ₽", img: "currency_5"),
    SelectCurrencyModel(name: "Dolar $", img: "currency_6"),
    SelectCurrencyModel(name: "Dirhem د.إ", img: "currency_7")
]

private var currencyModel2 = [
    SelectCurrencyModel(name: "Pound £", img: "currency_1"),
    SelectCurrencyModel(name: "Lyra ₺", img: "currency_2"),
    SelectCurrencyModel(name: "Евро €", img: "currency_3"),
    SelectCurrencyModel(name: "Euro GEL", img: "currency_4"),
    SelectCurrencyModel(name: "Ruble ₽", img: "currency_5"),
    SelectCurrencyModel(name: "Dolar $", img: "currency_6"),
    SelectCurrencyModel(name: "Dirhem د.إ", img: "currency_7"),
]



struct SecondFragment : View {
    
    @State var allCurencyModelState1 = [ false, false, false, false, false, false, false, false, false, false ]
    @State var allCurencyModelState2 = [ false, false, false, false, false, false, false, false, false, false ]
    
    @State var model1: CurrencyModel? = nil
    @State var model2: CurrencyModel? = nil
    
    @State var name: String = ""
    
    
    @ViewBuilder
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                Text("Dönüştürmek istediğiniz para birimini seçin")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding([.vertical], 20)
                
                Spacer()
                VStack {
                    ForEach(models.indices, id: \.self) { model in
                        SelectCurrencyCard(
                            model: models[model],
                            selected: allCurencyModelState1[model]
                        ) {
                            model1 = models[model]
                            allCurencyModelState1 = selectCurrency(id: model, stateList: allCurencyModelState1)
                            
                        }
                    }
                }
        
                
                Text("Dönüştürmek istediğiniz para birimini seçin")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                    
                VStack {
                    ForEach(models.indices, id: \.self) { model in
                        SelectCurrencyCard(
                            model: models[model],
                            selected: allCurencyModelState2[model]
                        ) {
                            model2 = models[model]
                            allCurencyModelState2 = selectCurrency(id: model, stateList: allCurencyModelState2)
                            
                        }
                    }
                }
                Spacer()
                    .frame(height: 50)
                
                NavigationLink(
                    destination: {
                        ConverterAdditionalFragment(model1: model1, model2: model2)
                        // ConverterAdditionalFragment(currency: calculateCurrency(currencyIndex1: allCurencyModelState1, currencyIndex2: allCurencyModelState2), name: name)
                    }
                ) {
                    Text("Dönüştür")
                        .padding([.horizontal], 100)
                        .padding([.vertical], 20)
                        .foregroundColor(.white)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                }
                
            }
            .navigationTitle("Dönüştürücü")
        }
    }
}


private func selectCurrency(id: Int, stateList: [Bool]) -> [Bool]  {
    var res = [Bool]()
    for i in stateList.indices {
        if i == id {
            res.append(true)
            continue
        }
        res.append(false)
        continue
    }
    
    return res
}

private func calculateCurrency(
    currencyIndex1: [Bool],
    currencyIndex2: [Bool]
) -> [Float] {
    var res = [Float]()
    
    res.append(1)
    
    if(currencyIndex1[0] && currencyIndex2[0]) { res.append(1)}
    if(currencyIndex1[0] && currencyIndex2[1]) { res.append(36) }
    if(currencyIndex1[0] && currencyIndex2[2]) { res.append(1.16) }
    if(currencyIndex1[0] && currencyIndex2[3]) { res.append(3.36) }
    if(currencyIndex1[0] && currencyIndex2[4]) { res.append(113.30) }
    if(currencyIndex1[0] && currencyIndex2[5]) { res.append(1.26) }
    if(currencyIndex1[0] && currencyIndex2[6]) { res.append(4.62) }
    
    if(currencyIndex1[1] && currencyIndex2[0]) { res.append(0.027) }
    if(currencyIndex1[1] && currencyIndex2[1]) { res.append(1) }
    if(currencyIndex1[1] && currencyIndex2[2]) { res.append(0.032) }
    if(currencyIndex1[1] && currencyIndex2[3]) { res.append(0.092 ) }
    if(currencyIndex1[1] && currencyIndex2[4]) { res.append(3.10) }
    if(currencyIndex1[1] && currencyIndex2[5]) { res.append(0.034) }
    if(currencyIndex1[1] && currencyIndex2[6]) { res.append(0.35) }
    
    if(currencyIndex1[2] && currencyIndex2[0]) { res.append(0.86) }
    if(currencyIndex1[2] && currencyIndex2[1]) { res.append(31.37) }
    if(currencyIndex1[2] && currencyIndex2[2]) { res.append(1) }
    if(currencyIndex1[2] && currencyIndex2[3]) { res.append(2.88) }
    if(currencyIndex1[2] && currencyIndex2[4]) { res.append(97.34) }
    if(currencyIndex1[2] && currencyIndex2[5]) { res.append(1.08) }
    if(currencyIndex1[2] && currencyIndex2[6]) { res.append(3.97) }
    
    if(currencyIndex1[3] && currencyIndex2[0]) { res.append(0.30) }
    if(currencyIndex1[3] && currencyIndex2[1]) { res.append(10.88) }
    if(currencyIndex1[3] && currencyIndex2[2]) { res.append(0.35) }
    if(currencyIndex1[3] && currencyIndex2[3]) { res.append(1) }
    if(currencyIndex1[3] && currencyIndex2[4]) { res.append(33.77) }
    if(currencyIndex1[3] && currencyIndex2[5]) { res.append(0.37) }
    if(currencyIndex1[3] && currencyIndex2[6]) { res.append(1.38) }
    
    if(currencyIndex1[4] && currencyIndex2[0]) { res.append(0.0088) }
    if(currencyIndex1[4] && currencyIndex2[1]) { res.append(0.32) }
    if(currencyIndex1[4] && currencyIndex2[2]) { res.append(0.010) }
    if(currencyIndex1[4] && currencyIndex2[3]) { res.append(0.030) }
    if(currencyIndex1[4] && currencyIndex2[4]) { res.append(1) }
    if(currencyIndex1[4] && currencyIndex2[5]) { res.append(0.011) }
    if(currencyIndex1[4] && currencyIndex2[6]) { res.append(0.041) }
    
    if(currencyIndex1[5] && currencyIndex2[0]) { res.append(0.80) }
    if(currencyIndex1[5] && currencyIndex2[1]) { res.append(29.04) }
    if(currencyIndex1[5] && currencyIndex2[2]) { res.append(0.93) }
    if(currencyIndex1[5] && currencyIndex2[3]) { res.append(2.67) }
    if(currencyIndex1[5] && currencyIndex2[4]) { res.append(90.13) }
    if(currencyIndex1[5] && currencyIndex2[5]) { res.append(1) }
    if(currencyIndex1[5] && currencyIndex2[6]) { res.append(3.67) }
    
    if(currencyIndex1[6] && currencyIndex2[0]) { res.append(0.22) }
    if(currencyIndex1[6] && currencyIndex2[1]) { res.append(7.91) }
    if(currencyIndex1[6] && currencyIndex2[2]) { res.append(0.25) }
    if(currencyIndex1[6] && currencyIndex2[3]) { res.append(0.73) }
    if(currencyIndex1[6] && currencyIndex2[4]) { res.append(24.54) }
    if(currencyIndex1[6] && currencyIndex2[5]) { res.append(0.27) }
    if(currencyIndex1[6] && currencyIndex2[6]) { res.append(1) }
    
    
    res.append(-10)
    return res
}

private func checkFulled(
    currencyIndex1: [Bool],
    currencyIndex2: [Bool]
) -> Bool {
    for i in currencyIndex1 {
        if !i {
            return false
        }
    }
    for i in currencyIndex2 {
        if !i {
            return false
        }
    }
    
    return true
}
